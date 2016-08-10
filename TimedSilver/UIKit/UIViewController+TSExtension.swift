//
//  UIViewController+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 11/6/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    /**
     直接加载 xib，创建 ViewController
     
     - returns: UIViewController
     */
    class func ts_initFromNib() -> UIViewController {
        let hasNib: Bool = NSBundle.mainBundle().pathForResource(self.ts_className, ofType: "nib") != nil
        guard hasNib else {
            assert(!hasNib, "Invalid parameter") // here
            return UIViewController()
        }
        return self.init(nibName: self.ts_className, bundle: nil)
    }
    
    static var ts_topViewController: UIViewController? {
        var presentedVC = UIApplication.sharedApplication().keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController {
            presentedVC = pVC
        }
        
        if presentedVC == nil {
            print("Error: You don't have any views set. You may be calling them in viewDidLoad. Try viewDidAppear instead.")
        }
        return presentedVC
    }
    
    /**
     Back bar with go to previous action
     
     - parameter backImage: your image. 20px * 20px is perfect
     */
    func ts_leftBackToPrevious(backImage: UIImage) {
        self.ts_leftBackBarButton(backImage, action: {})
    }
    
    /**
     Be sure of your viewController has a UINavigationController
     Left back bar. If your viewController is from push action, then handler will execute popViewControllerAnimated method. If your viewController is from present action, then handler will excute dismissViewControllerAnimated method.
     
     - parameter backImage: your image. 20px * 20px is perfect
     - parameter action:    handler
     */
    func ts_leftBackBarButton(backImage: UIImage, action: (Void) -> Void) {
        guard self.navigationController != nil else {
            assert(false, "Your target ViewController doesn't have a UINavigationController")
            return
        }
        
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        button.setImage(backImage, forState: .Normal)
        button.frame = CGRectMake(0, 0, 40, 30)
        button.imageView!.contentMode = .ScaleAspectFit;
        button.contentHorizontalAlignment = .Left
        
        button.ts_addEventHandler(forControlEvent: .TouchUpInside, handler: {[weak self] in
            if self!.navigationController!.viewControllers.count > 1 {
                self!.navigationController?.popViewControllerAnimated(true)
            } else if (self!.presentingViewController != nil) {
                self!.dismissViewControllerAnimated(true, completion: nil)
            }
        })
        
        let barButton = UIBarButtonItem(customView: button)
        let gapItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        gapItem.width = -7  //fix the space
        self.navigationItem.leftBarButtonItems = [gapItem, barButton]
    }

}




