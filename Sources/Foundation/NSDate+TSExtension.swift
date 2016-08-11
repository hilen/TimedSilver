//
//  NSDate+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

public extension NSDate {
    /// Convert NSDate to Millisecond
    class var ts_milliseconds: NSTimeInterval {
        get { return NSDate().timeIntervalSince1970 * 1000 }
    }
}
