//
//  NSIndexPath+TSOffset.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/5/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

extension NSIndexPath {
    var ts_previousRow: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.row - 1, inSection: self.section)
        return indexPath
    }
    
    var ts_nextRow: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.row + 1, inSection: self.section)
        return indexPath
    }
    
    var ts_previousItem: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.item - 1, inSection: self.section)
        return indexPath
    }
    
    var ts_nextItem: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.item + 1, inSection: self.section)
        return indexPath
    }
    
    var ts_previousSection: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.row, inSection: self.section - 1)
        return indexPath
    }
    
    var ts_nextSection: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.row, inSection: self.section + 1)
        return indexPath
    }
}



