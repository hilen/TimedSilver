//
//  UINavigationItem+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/4/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

extension UINavigationItem {
    /**
     Custom left UINavigationItem
     
     - parameter image:  your image
     - parameter action: handler
     */
    func ts_leftButtonAction(image: UIImage, action:(Void) -> Void) {
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        button.setImage(image, forState: .Normal)
        button.frame = CGRectMake(0, 0, 40, 30)
        button.imageView!.contentMode = .ScaleAspectFit;
        button.contentHorizontalAlignment = .Left
        button.ts_addEventHandler(forControlEvent: .TouchUpInside, handler: {
            action()
        })
        let barButton = UIBarButtonItem(customView: button)
        let gapItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        gapItem.width = -7 //fix the space
        self.leftBarButtonItems = [gapItem, barButton]
    }
    
    /**
     Custom right UINavigationItem
     
     - parameter image:  your image
     - parameter action: handler
     */
    func ts_rightButtonAction(image: UIImage, action:(Void) -> Void) {
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        button.setImage(image, forState: .Normal)
        button.frame = CGRectMake(0, 0, 40, 30)
        button.imageView!.contentMode = .ScaleAspectFit;
        button.contentHorizontalAlignment = .Right
        button.ts_addEventHandler(forControlEvent: .TouchUpInside, handler: {
            action()
        })
        let barButton = UIBarButtonItem(customView: button)
        let gapItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        gapItem.width = -7 //fix the space
        self.rightBarButtonItems = [gapItem, barButton]
    }
}


