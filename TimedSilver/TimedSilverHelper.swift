//
//  TimedSilverHelper.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/9/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

// https://github.com/onevcat/Kingfisher/blob/master/Sources/ThreadHelper.swift

func ts_dispatch_async_safely_to_main_queue(block: ()->()) {
    ts_dispatch_async_safely_to_queue(dispatch_get_main_queue(), block)
}

// This methd will dispatch the `block` to a specified `queue`.
// If the `queue` is the main queue, and current thread is main thread, the block
// will be invoked immediately instead of being dispatched.
func ts_dispatch_async_safely_to_queue(queue: dispatch_queue_t, _ block: ()->()) {
    if queue === dispatch_get_main_queue() && NSThread.isMainThread() {
        block()
    } else {
        dispatch_async(queue) {
            block()
        }
    }
}

/// Print log
func ts_printLog<T>(message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}




