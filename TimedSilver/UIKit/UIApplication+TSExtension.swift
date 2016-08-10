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
    public static var ts_screenOrientation: UIInterfaceOrientation {
        return UIApplication.sharedApplication().statusBarOrientation
    }
    
    public static var ts_screenStatusBarHeight: CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.height
    }
}

