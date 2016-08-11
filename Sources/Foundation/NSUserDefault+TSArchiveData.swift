//
//  NSUserDefault+TSArchiveData.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/9/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

public extension NSUserDefaults {
    /**
     Set Archive Data
     
     - parameter object: object
     - parameter key:    key
     */
    func ts_setArchiveData<T: NSCoding>(object: T, forKey key: String) {
        let data = NSKeyedArchiver.archivedDataWithRootObject(object)
        setObject(data, forKey: key)
    }
    
    /**
     Get Archive Data
     
     - parameter _:   type
     - parameter key: key
     
     - returns: T
     */
    func ts_archiveDataForKey<T: NSCoding>(_: T.Type, key: String) -> T? {
        guard let data = objectForKey(key) as? NSData else { return nil }
        guard let object = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? T else { return nil }
        return object
    }
}