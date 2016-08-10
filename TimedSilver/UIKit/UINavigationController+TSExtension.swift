//
//  UINavigationController+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/10/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

extension UINavigationController {
    /**
     Push with UIViewAnimationTransition
     
     - parameter controller: target viewController
     - parameter transition: UIViewAnimationTransition
     */
    public func ts_pushViewController(controller: UIViewController, transition: UIViewAnimationTransition) {
        UIView.beginAnimations(nil, context: nil)
        self.pushViewController(controller, animated: false)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transition, forView: self.view, cache: true)
        UIView.commitAnimations()
    }
    
    /**
     Pop with UIViewAnimationTransition
     
     - parameter controller: target viewController
     - parameter transition: UIViewAnimationTransition
     
     - returns: UIViewController
     */
    public func ts_popViewController(controller: UIViewController, transition: UIViewAnimationTransition) -> UIViewController {
        UIView.beginAnimations(nil, context: nil)
        let controller = self.popViewControllerAnimated(false)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transition, forView: self.view, cache: true)
        UIView.commitAnimations()
        return controller!
    }
}