//
//  NSIndexSet+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/9/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation


//- (NSArray *)qb_indexPathsFromIndexesWithSection:(NSUInteger)section
//{
//    NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:self.count];
//    [self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
//        [indexPaths addObject:[NSIndexPath indexPathForItem:idx inSection:section]];
//        }];
//    return indexPaths;
//}

public extension NSIndexSet {
    func ts_indexPathsFromIndexes(section: NSInteger) -> [NSIndexPath] {
        var indexPaths = [NSIndexPath]()
        self.enumerateIndexesUsingBlock { index, stop in
            let path = NSIndexPath(forItem: index, inSection: section)
            indexPaths.append(path)
        }
        return indexPaths
    }
}