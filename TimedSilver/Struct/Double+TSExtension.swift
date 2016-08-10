//
//  Double+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/10/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

// MARK: - Time extensions

public extension Double {
    var ts_millisecond: NSTimeInterval  { return self / 1000 }
    var ts_milliseconds: NSTimeInterval { return self / 1000 }
    var ts_ms: NSTimeInterval           { return self / 1000 }
    
    var ts_second: NSTimeInterval       { return self }
    var ts_seconds: NSTimeInterval      { return self }
    
    var ts_minute: NSTimeInterval       { return self * 60 }
    var ts_minutes: NSTimeInterval      { return self * 60 }
    
    var ts_hour: NSTimeInterval         { return self * 3600 }
    var ts_hours: NSTimeInterval        { return self * 3600 }
    
    var ts_day: NSTimeInterval          { return self * 3600 * 24 }
    var ts_days: NSTimeInterval         { return self * 3600 * 24 }
}
