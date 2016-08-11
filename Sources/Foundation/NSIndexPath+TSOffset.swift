//
//  NSIndexPath+TSOffset.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/5/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

public extension NSIndexPath {
    /// The previous row's NSIndexPath. UITableView
    var ts_previousRow: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.row - 1, inSection: self.section)
        return indexPath
    }
    
    /// The next row's NSIndexPath. UITableView
    var ts_nextRow: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.row + 1, inSection: self.section)
        return indexPath
    }
    
    /// The previous item's NSIndexPath. UICollectionView
    var ts_previousItem: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.item - 1, inSection: self.section)
        return indexPath
    }
    
    /// The next item's NSIndexPath. UICollectionView
    var ts_nextItem: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.item + 1, inSection: self.section)
        return indexPath
    }
    
    /// The previous section. Both of UICollectionView and UITableView
    var ts_previousSection: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.row, inSection: self.section - 1)
        return indexPath
    }
    
    /// The next section. Both of UICollectionView and UITableView
    var ts_nextSection: NSIndexPath {
        let indexPath = NSIndexPath(forRow: self.row, inSection: self.section + 1)
        return indexPath
    }
}



