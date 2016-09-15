//
//  Date+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 2/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

public extension Date {
    /// Convert NSDate to Millisecond
    static var ts_milliseconds: TimeInterval {
        get { return Date().timeIntervalSince1970 * 1000 }
    }
}
