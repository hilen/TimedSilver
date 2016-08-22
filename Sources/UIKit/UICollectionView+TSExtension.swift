//
//  UICollectionView+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/5/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    /**
     Last indexPath in section
     
     - parameter section: section
     
     - returns: NSIndexPath
     */
    func ts_lastIndexPathInSection(section: Int) -> NSIndexPath? {
        return NSIndexPath(forRow: self.numberOfItemsInSection(section)-1, inSection: section)
    }
    
    /// Last indexPath in UICollectionView
    var ts_lastIndexPath: NSIndexPath? {
        if (self.ts_totalItems - 1) > 0 {
            return NSIndexPath(forRow: self.ts_totalItems-1, inSection: self.numberOfSections())
        } else {
            return nil
        }
    }
    
    /// Total items in UICollectionView
    var ts_totalItems: Int {
        var i = 0
        var rowCount = 0
        while i < self.numberOfSections() {
            rowCount += self.numberOfItemsInSection(i)
            i += 1
        }
        return rowCount
    }
    
    /**
     Scroll to the bottom
     
     - parameter animated: animated
     */
    func ts_scrollToBottom(animated: Bool) {
        let section = self.numberOfSections() - 1
        let row = self.numberOfItemsInSection(section) - 1
        if section < 0 || row < 0 {
            return
        }
        let path = NSIndexPath(forRow: row, inSection: section)
        let offset = contentOffset.y
        self.scrollToItemAtIndexPath(path, atScrollPosition: .Top, animated: animated)
        let delay = (animated ? 0.1 : 0.0) * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
            if self.contentOffset.y != offset {
                self.ts_scrollToBottom(false)
            }
        })
    }
}





