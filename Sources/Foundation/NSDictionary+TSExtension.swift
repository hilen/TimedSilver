//
//  NSDictionary+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/4/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

public extension NSDictionary {
    /**
     Init from json string
     
     - parameter ts_JSONString: json string
     
     - returns: NSDictionary or nil
     */
    public convenience init? (ts_JSONString: String) {
        if let data = (try? NSJSONSerialization.JSONObjectWithData(ts_JSONString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!, options: NSJSONReadingOptions.MutableContainers)) as? NSDictionary {
            self.init(dictionary: data)
        } else {
            self.init()
            return nil
        }
    }
    
    /**
     Make the NSDictionary to json string
     
     - returns: string or nil
     */
    public func ts_formatJSON() -> String? {
        if let jsonData = try? NSJSONSerialization.dataWithJSONObject(self, options: NSJSONWritingOptions()) {
            let jsonStr = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
            return String(jsonStr ?? "")
        }
        return nil
    }
}


