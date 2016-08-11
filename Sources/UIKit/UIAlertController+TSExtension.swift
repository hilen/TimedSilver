//
//  UIAlertController+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/11/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

public extension UIAlertController {
    /**
     Single button alert
     
     - parameter title:      title
     - parameter message:    message
     - parameter completion: completion
     
     - returns: UIAlertController
     */
    class func ts_singleButtonAlertWithTitle(
        title: String,
        message: String,
        completion: (() -> Void)?) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        alert.ts_show()
        return alert
    }
    
    /**
     Two button alert
     
     - parameter title:            title
     - parameter message:          message
     - parameter otherButtonTitle: otherButtonTitle
     - parameter completion:       completion
     
     - returns: UIAlertController
     */
    class func ts_doubleButtonAlertWithTitle(
        title: String,
        message: String,
        otherButtonTitle: String,
        completion: (() -> Void)?) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: otherButtonTitle, style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        alert.ts_show()
        return alert
    }

    /**
     Show UIAlertController
     */
    func ts_show() {
        self.ts_present(true, completion: nil)
    }
    
    private func ts_present(animated: Bool, completion: (() -> Void)?) {
        if let rootVC = UIApplication.sharedApplication().keyWindow?.rootViewController {
            self.ts_presentFromController(rootVC, animated: animated, completion: completion)
        }
    }
    
    private func ts_presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navVC = controller as? UINavigationController,
            let visibleVC = navVC.visibleViewController {
            self.ts_presentFromController(visibleVC, animated: animated, completion: completion)
        }  else {
            controller.presentViewController(self, animated: animated, completion: completion);
        }
    }
}

