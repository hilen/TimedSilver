//
//  UIApplication+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/10/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    ///Get screen orientation
    public static var ts_screenOrientation: UIInterfaceOrientation {
        return UIApplication.sharedApplication().statusBarOrientation
    }
    
    ///Get status bar's height
    public static var ts_screenStatusBarHeight: CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.height
    }
    
    //https://github.com/goktugyil/EZSwiftExtensions/blob/master/Sources/UIApplicationExtensions.swift
    /**
     Run a block in background after app resigns activity
     
     - parameter closure:           The closure
     - parameter expirationHandler: The expiration handler
     */
    public func ts_runIntoBackground(closure: () -> Void, expirationHandler: (() -> Void)? = nil) {
        dispatch_async(dispatch_get_main_queue()) {
            let taskID: UIBackgroundTaskIdentifier
            if let expirationHandler = expirationHandler {
                taskID = self.beginBackgroundTaskWithExpirationHandler(expirationHandler)
            } else {
                taskID = self.beginBackgroundTaskWithExpirationHandler({ })
            }
            closure()
            self.endBackgroundTask(taskID)
        }
    }
}

