//
//  NSRange+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 9/15/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

public extension NSRange {
    init(ts_location:Int, ts_length:Int) {
        self.location = ts_location
        self.length = ts_length
    }
    
    init(_ location:Int, _ length:Int) {
        self.location = location
        self.length = length
    }
    
    init(ts_range:Range <Int>) {
        self.location = ts_range.lowerBound
        self.length = ts_range.upperBound - ts_range.lowerBound
    }
    
    init(_ range:Range <Int>) {
        self.location = range.lowerBound
        self.length = range.upperBound - range.lowerBound
    }
    
    var ts_startIndex:Int { get { return location } }
    var ts_endIndex:Int { get { return location + length } }
    var ts_asRange:Range<Int> { get { return location..<location + length } }
    var ts_isEmpty:Bool { get { return length == 0 } }
    
    func ts_contains(index:Int) -> Bool {
        return index >= location && index < ts_endIndex
    }
    
    func ts_clamp(index:Int) -> Int {
        return max(self.ts_startIndex, min(self.ts_endIndex - 1, index))
    }
    
    func ts_intersects(range:NSRange) -> Bool {
        return NSIntersectionRange(self, range).ts_isEmpty == false
    }
    
    func ts_intersection(range:NSRange) -> NSRange {
        return NSIntersectionRange(self, range)
    }
    
    func ts_union(range:NSRange) -> NSRange {
        return NSUnionRange(self, range)
    }
}
