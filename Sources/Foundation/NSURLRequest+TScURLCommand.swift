//
//  NSURLRequest+TScURLCommand.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/10/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

extension NSURLRequest {
    private func escapeQuotesInString(string: String) -> String {
        assert(string.characters.count > 0 , "Error: String is not valid")
        return string.stringByReplacingOccurrencesOfString("\"", withString:"\\\"", options: NSStringCompareOptions.LiteralSearch, range: nil)
    }

    /**
    Sample :
     
    let URLString = "https://httpbin.org/get"
    let parameters = [
        "foo":"bar"
    ]
    let request = Alamofire.request(.GET, URLString, parameters: parameters, encoding:.JSON).responseJSON { response in
        switch response.result {
        case .Success(let JSON):
            print("Success with JSON: \(JSON)")
            success!(JSON as! NSDictionary)
        case .Failure(let error):
            print("Request failed with error: \(error)")
            failure!(error)
        }
    }
    print("\n Request cURL command:\(request!.cURLCommandString()) \n")
 
    Step1：curl -k -X POST --dump-header - -H "Accept: application/json" -H "Content-Type: application/json" -d "{ \"password\" : \"pass\", \"username\" : \"test\"}" "http://httpbin.org/post"
     
    Step2: copy the the command and paste it into Terminal.
     
     - returns: cURL command string
     */
    public func cURLCommandString() -> String! {
        let curlString: NSMutableString = NSMutableString(string:"curl -k -X \(self.HTTPMethod!) --dump-header -")
        
        if let allHTTPHeaderFields: [String : String] = self.allHTTPHeaderFields {
            for key: String in allHTTPHeaderFields.keys {
                let headerKey: String = self.escapeQuotesInString(key)
                let headerValue: String = self.escapeQuotesInString(allHTTPHeaderFields[key]!)
                curlString.appendFormat(" -H \"%@: %@\"", headerKey, headerValue)
            }
        }
        
        if let body: NSData = self.HTTPBody where self.HTTPBody != nil {
            if var bodyDataString = String(data: body, encoding: NSUTF8StringEncoding) {
                if bodyDataString.characters.count > 0 {
                    bodyDataString = self.escapeQuotesInString(bodyDataString)
                    curlString.appendFormat(" -d \"%@\"", bodyDataString)
                }
            }
        }
        curlString.appendFormat(" \"%@\"", self.URL!.absoluteString)
        
        let trimmed = curlString.stringByReplacingOccurrencesOfString("\n", withString: "").stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
        return trimmed as String
    }
}
