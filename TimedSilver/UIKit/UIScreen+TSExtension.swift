//
//  UIScreen+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 11/3/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import Foundation
import UIKit

public extension UIScreen {
    class var ts_size: CGSize {
        return UIScreen.mainScreen().bounds.size
    }
    
    class var ts_width: CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    class var ts_height: CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
    
    class var ts_orientationSize: CGSize {
        let systemVersion = (UIDevice.currentDevice().systemVersion as NSString).floatValue
        let isLand: Bool = UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)
        return (systemVersion > 8.0 && isLand) ? UIScreen.ts_SwapSize(self.ts_size) : self.ts_size
    }
    
    class var ts_orientationWidth: CGFloat {
        return self.ts_orientationSize.width
    }
    
    class var ts_orientationHeight: CGFloat {
        return self.ts_orientationSize.height
    }
    
    class var ts_DPISize: CGSize {
        let size: CGSize = UIScreen.mainScreen().bounds.size
        let scale: CGFloat = UIScreen.mainScreen().scale
        return CGSizeMake(size.width * scale, size.height * scale)
    }
    
    class func ts_SwapSize(size: CGSize) -> CGSize {
        return CGSizeMake(size.height, size.width)
    }
    
    class var ts_screenHeightWithoutStatusBar: CGFloat {
        if UIInterfaceOrientationIsPortrait(UIApplication.sharedApplication().statusBarOrientation) {
            return UIScreen.mainScreen().bounds.size.height - UIApplication.sharedApplication().statusBarFrame.height
        } else {
            return UIScreen.mainScreen().bounds.size.width - UIApplication.sharedApplication().statusBarFrame.height
        }
    }
}



