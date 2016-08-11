//
//  NSUserDefault+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/9/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

public extension NSUserDefaults {
    // MARK: - Getter
    
    /**
     Get object from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_objectForKey(key: String, defaultValue: AnyObject? = nil) -> AnyObject? {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue
        }
        return NSUserDefaults.standardUserDefaults().objectForKey(key)
    }
    
    /**
     Get integer from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_integerForKey(key: String, defaultValue: Int? = nil) -> Int {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().integerForKey(key)
    }
    
    /**
     Get bool from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_boolForKey(key: String, defaultValue: Bool? = nil) -> Bool {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().boolForKey(key)
    }
    
    /**
     Get float from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_floatForKey(key: String, defaultValue: Float? = nil) -> Float {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().floatForKey(key)
    }

    /**
     Get double from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_doubleForKey(key: String, defaultValue: Double? = nil) -> Double {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().doubleForKey(key)
    }
    
    /**
     Get string from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_stringForKey(key: String, defaultValue: String? = nil) -> String? {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().stringForKey(key)
    }
    
    /**
     Get NSData from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_dataForKey(key: String, defaultValue: NSData? = nil) -> NSData? {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().dataForKey(key)
    }
    
    /**
     Get NSURL from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_URLForKey(key: String, defaultValue: NSURL? = nil) -> NSURL? {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().URLForKey(key)
    }
    
    /**
     Get array from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_arrayForKey(key: String, defaultValue: [AnyObject]? = nil) -> [AnyObject]? {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().arrayForKey(key)
    }
    
    /**
     Get dictionary from NSUserDefaults
     
     - parameter key:          key
     - parameter defaultValue: defaultValue, this can be nil
     
     - returns: AnyObject
     */
    class func ts_dictionaryForKey(key: String, defaultValue: [String : AnyObject]? = nil) -> [String : AnyObject]? {
        if (defaultValue != nil) && ts_objectForKey(key) == nil {
            return defaultValue!
        }
        return NSUserDefaults.standardUserDefaults().dictionaryForKey(key)
    }

    // MARK: - Setter
    
    /**
     Set object for key
     
     - parameter key:   key
     - parameter value: value
     */
    class func ts_setObject(key: String, value: AnyObject?) {
        if value == nil {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
        } else {
            NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
        }
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /**
     Set integer for key
     
     - parameter key:   key
     - parameter value: value
     */
    class func ts_setInteger(key: String, value: Int) {
        NSUserDefaults.standardUserDefaults().setInteger(value, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /**
     Set bool for key
     
     - parameter key:   key
     - parameter value: value
     */
    class func ts_setBool(key: String, value: Bool) {
        NSUserDefaults.standardUserDefaults().setBool(value, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /**
     Set float for key
     
     - parameter key:   key
     - parameter value: value
     */
    class func ts_setFloat(key: String, value: Float) {
        NSUserDefaults.standardUserDefaults().setFloat(value, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /**
     Set string for key
     
     - parameter key:   key
     - parameter value: value
     */
    class func ts_setString(key: String, value: NSString?) {
        if (value == nil) {
            NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
        } else {
            NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
        }
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /**
     Set data for key
     
     - parameter key:   key
     - parameter value: value
     */
    class func ts_setData(key: String, value: NSData) {
        self.ts_setObject(key, value: value)
    }
    
    /**
     Set array for key
     
     - parameter key:   key
     - parameter value: value
     */
    class func ts_setArray(key: String, value: [AnyObject]) {
        self.ts_setObject(key, value: value)
    }
    
    /**
     Set dictionary for key
     
     - parameter key:   key
     - parameter value: value
     */
    class func ts_setDictionary(key: String, value: [String : AnyObject]) {
        self.ts_setObject(key, value: value)
    }
}



