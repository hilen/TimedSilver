//
//  NSFileManager+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/10/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation

extension NSFileManager {
    class func ts_documentURL() -> NSURL {
        return ts_URLForDirectory(.DocumentDirectory)!
    }
    
    class func ts_documentPath() -> String {
        return ts_pathForDirectory(.DocumentDirectory)!
    }
    
    class func ts_libraryURL() -> NSURL {
        return ts_URLForDirectory(.LibraryDirectory)!
    }
    
    class func ts_libraryPath() -> String {
        return ts_pathForDirectory(.LibraryDirectory)!
    }
    
    class func ts_cachesURL() -> NSURL {
        return ts_URLForDirectory(.CachesDirectory)!
    }
    
    class func ts_cachesPath() -> String {
        return ts_pathForDirectory(.CachesDirectory)!
    }
    
    class func ts_addSkipBackupAttributeToFile(filePath: String) {
        if let url: NSURL = NSURL(fileURLWithPath: filePath) {
            do { try url.setResourceValue(NSNumber(bool: true), forKey: NSURLIsExcludedFromBackupKey) } catch {}
        }
    }
    
    class func ts_availableDiskSpaceMb() -> Double {
        let fileAttributes = try? defaultManager().attributesOfFileSystemForPath(ts_documentPath())
        if let fileSize = fileAttributes![NSFileSystemSize]?.doubleValue {
            return fileSize / Double(0x100000)
        }
        return 0
    }
    
    private class func ts_URLForDirectory(directory: NSSearchPathDirectory) -> NSURL? {
        return defaultManager().URLsForDirectory(directory, inDomains: .UserDomainMask).last
    }
    
    private class func ts_pathForDirectory(directory: NSSearchPathDirectory) -> String? {
        return NSSearchPathForDirectoriesInDomains(directory, .UserDomainMask, true)[0]
    }
}