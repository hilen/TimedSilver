//
//  UIControl+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/9/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

fileprivate class TSClosureWrapper : NSObject {
    let _callback : (Void) -> Void
    init(callback : @escaping (Void) -> Void) {
        _callback = callback
    }
    
    func invoke() {
        _callback()
    }
}

fileprivate var AssociatedClosure: UInt8 = 0


public extension UIControl {
    /**
     UIControl with closure callback
     
     - parameter events:   UIControlEvents
     - parameter callback: callback
     */
    func ts_addEventHandler(forControlEvent controlEvent: UIControlEvents, handler callback: @escaping (Void) -> Void) {
        let wrapper = TSClosureWrapper(callback: callback)
        addTarget(wrapper, action:#selector(TSClosureWrapper.invoke), for: controlEvent)
        objc_setAssociatedObject(self, &AssociatedClosure, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}



