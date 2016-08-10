//
//  UIScrollView+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/5/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    private struct AssociatedKeys {
        static var kKeyScrollViewVerticalIndicator = "_verticalScrollIndicator"
        static var kKeyScrollViewHorizontalIndicator = "_horizontalScrollIndicator"
    }
    
    ///  YES if the scrollView's offset is at the very top.
    public var ts_isAtTop: Bool {
        get { return self.contentOffset.y == 0.0 ? true : false }
    }
    
    ///  YES if the scrollView's offset is at the very bottom.
    public var ts_isAtBottom: Bool {
        get {
            let bottomOffset = self.contentSize.height - self.bounds.size.height
            return self.contentOffset.y == bottomOffset ? true : false
        }
    }
    
    ///  YES if the scrollView can scroll from it's current offset position to the bottom.
    public var ts_canScrollToBottom: Bool {
        get { return self.contentSize.height > self.bounds.size.height ? true : false }
    }
    
    /// The vertical scroll indicator view.
    public var ts_verticalScroller: UIView {
        get {
            if (objc_getAssociatedObject(self, #function) == nil) {
                objc_setAssociatedObject(self, #function, self.ts_safeValueForKey(AssociatedKeys.kKeyScrollViewVerticalIndicator), objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN);
            }
            return objc_getAssociatedObject(self, #function) as! UIView
        }
    }
    
    /// The horizontal scroll indicator view.
    public var ts_horizontalScroller: UIView {
        get {
            if (objc_getAssociatedObject(self, #function) == nil) {
                objc_setAssociatedObject(self, #function, self.ts_safeValueForKey(AssociatedKeys.kKeyScrollViewHorizontalIndicator), objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN);
            }
            return objc_getAssociatedObject(self, #function) as! UIView
        }
    }
    
    private func ts_safeValueForKey(key: String) -> AnyObject{
        let instanceVariable: Ivar = class_getInstanceVariable(self.dynamicType, key.cStringUsingEncoding(NSUTF8StringEncoding)!)
        return object_getIvar(self, instanceVariable);
    }
    
    
    /**
     Sets the content offset to the top.
     
     - parameter animated: animated YES to animate the transition at a constant velocity to the new offset, NO to make the transition immediate.
     */
    public func ts_scrollToTopAnimated(animated: Bool) {
        if !self.ts_isAtTop {
            let bottomOffset = CGPointZero;
            self.setContentOffset(bottomOffset, animated: animated)
        }
    }
    
    /**
     Sets the content offset to the bottom.
     
     - parameter animated: animated YES to animate the transition at a constant velocity to the new offset, NO to make the transition immediate.
     */
    public func ts_scrollToBottomAnimated(animated: Bool) {
        if self.ts_canScrollToBottom && !self.ts_isAtBottom {
            let bottomOffset = CGPointMake(0.0, self.contentSize.height - self.bounds.size.height)
            self.setContentOffset(bottomOffset, animated: animated)
        }
    }
    
    /**
     Stops scrolling, if it was scrolling.
     */
    public func ts_stopScrolling() {
        guard self.dragging else {
            return
        }
        var offset = self.contentOffset
        offset.y -= 1.0
        self.setContentOffset(offset, animated: false)
        
        offset.y += 1.0
        self.setContentOffset(offset, animated: false)
    }
}


