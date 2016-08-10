//
//  UIView+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 11/6/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /**
     When the view should call init from nib
     
     - returns: UINib
     */
    class func ts_Nib() -> UINib {
        let hasNib: Bool = NSBundle.mainBundle().pathForResource(self.ts_className, ofType: "nib") != nil
        guard hasNib else {
            assert(!hasNib, "Invalid parameter") // assert
            return UINib()
        }
        return UINib(nibName: self.ts_className, bundle:nil)
    }
    
    /**
     All subviews of the UIView
     
     - returns: A group of UIView
     */
    func ts_allSubviews() -> [UIView] {
        var stack = [self]
        var views = [UIView]()
        while !stack.isEmpty {
            let subviews = stack[0].subviews as [UIView]
            views += subviews
            stack += subviews
            stack.removeAtIndex(0)
        }
        return views
    }
    
    /**
     Take snap shot
     
     - returns: UIImage
     */
    func ts_takeSnapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}







