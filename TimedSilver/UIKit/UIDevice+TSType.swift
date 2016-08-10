//
//  UIDevice+TSType.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/9/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

extension UIDevice {
    // MARK: - The iOS screen size
    enum ts_DeviceMaxWidth: Float {
        case iPhone4     = 480.0
        case iPhone5     = 568.0
        case iPhone6     = 667.0
        case iPhone6Plus = 736.0
        case iPad        = 1024.0
        case iPadPro     = 1366.0
    }
    
    enum ts_DeviceType: String {
        case iPhone
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPad
        case iPadPro
        case iTV
        case Unknown
    }
    
    class func ts_maxDeviceWidth() -> Float {
        let w = Float(UIScreen.mainScreen().bounds.width)
        let h = Float(UIScreen.mainScreen().bounds.height)
        return fmax(w, h)
    }
    
    class func ts_deviceType() -> ts_DeviceType {
        if ts_isPhone4()     { return ts_DeviceType.iPhone4     }
        if ts_isPhone5()     { return ts_DeviceType.iPhone5     }
        if ts_isPhone6()     { return ts_DeviceType.iPhone6     }
        if ts_isPhone6Plus() { return ts_DeviceType.iPhone6Plus }
        if ts_isPadPro()     { return ts_DeviceType.iPadPro     }
        if ts_isPad()        { return ts_DeviceType.iPad        }
        if ts_isPhone()      { return ts_DeviceType.iPhone      }
        if #available(iOS 9.0, *) {
            if ts_isTV() { return ts_DeviceType.iTV }
        }
        return ts_DeviceType.Unknown
    }
    
    class func ts_isPhone() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Phone
    }
    
    class func ts_isPad() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
    
    class func ts_isPadPro() -> Bool {
        return ts_isPad() && ts_maxDeviceWidth() == ts_DeviceMaxWidth.iPadPro.rawValue
    }
    
    @available(iOS 9, *)
    class func ts_isTV() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .TV
    }
    
    class func ts_isPhone4Earlier() -> Bool {
        return ts_isPhone() && ts_maxDeviceWidth() < ts_DeviceMaxWidth.iPhone4.rawValue
    }
    
    class func ts_isPhone4() -> Bool {
        return ts_isPhone() && ts_maxDeviceWidth() == ts_DeviceMaxWidth.iPhone4.rawValue
    }
    
    class func ts_isPhone4Larger() -> Bool {
        return ts_isPhone() && ts_maxDeviceWidth() >= ts_DeviceMaxWidth.iPhone4.rawValue
    }
    
    class func ts_isPhone5() -> Bool {
        return ts_isPhone() && ts_maxDeviceWidth() == ts_DeviceMaxWidth.iPhone5.rawValue
    }
    
    class func ts_isPhone5Larger() -> Bool {
        return ts_isPhone() && ts_maxDeviceWidth() >= ts_DeviceMaxWidth.iPhone5.rawValue
    }
    
    class func ts_isPhone6() -> Bool {
        return ts_isPhone() && ts_maxDeviceWidth() == ts_DeviceMaxWidth.iPhone6.rawValue
    }
    
    class func ts_isPhone6Larger() -> Bool {
        return ts_isPhone() && ts_maxDeviceWidth() >= ts_DeviceMaxWidth.iPhone6.rawValue
    }
    
    class func ts_isPhone6Plus() -> Bool {
        return ts_isPhone() && ts_maxDeviceWidth() == ts_DeviceMaxWidth.iPhone6Plus.rawValue
    }
    
    // MARK: - The iOS system version
    
    enum ts_iOSType: Float {
        case iOS7 = 7.0
        case iOS8 = 8.0
        case iOS9 = 9.0
        case Unknown = 0.0
    }
    
    class var ts_systemVersion: Float {
        struct Singleton {
            static let version = (UIDevice.currentDevice().systemVersion as NSString).floatValue
        }
        return Singleton.version
    }
    
    class func ts_systemType() -> ts_iOSType {
        if ts_iOS7() { return ts_iOSType.iOS7 }
        if ts_iOS8() { return ts_iOSType.iOS8 }
        if ts_iOS9() { return ts_iOSType.iOS9 }
        return ts_iOSType.Unknown
    }
    
    class func ts_iOS7() -> Bool {
        return ts_isPhone() && ts_systemVersion == ts_iOSType.iOS7.rawValue
    }
    
    class func ts_iOS8() -> Bool {
        return ts_isPhone() && ts_systemVersion == ts_iOSType.iOS8.rawValue
    }

    class func ts_iOS9() -> Bool {
        return ts_isPhone() && ts_systemVersion == ts_iOSType.iOS9.rawValue
    }
}

