//
//  NSFileManager+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/10/16.
//  Copyright © 2016 Hilen. All rights reserved.
//  https://github.com/shaojiankui/JKCategories/blob/master/JKCategories/Foundation/NSFileManager/NSFileManager%2BJKPaths.h

import Foundation

public extension NSFileManager {
    /**
     Get URL of Document directory.
     
     - returns: Document directory URL.
     */
    class func ts_documentURL() -> NSURL {
        return ts_URLForDirectory(.DocumentDirectory)!
    }
    
    /**
     Get String of Document directory.
     
     - returns: Document directory String.
     */
    class func ts_documentPath() -> String {
        return ts_pathForDirectory(.DocumentDirectory)!
    }
    
    /**
     Get URL of Library directory
     
     - returns: Library directory URL
     */
    class func ts_libraryURL() -> NSURL {
        return ts_URLForDirectory(.LibraryDirectory)!
    }
    
    /**
     Get String of Library directory
     
     - returns: Library directory String
     */
    class func ts_libraryPath() -> String {
        return ts_pathForDirectory(.LibraryDirectory)!
    }
    
    /**
     Get URL of Caches directory
     
     - returns: Caches directory URL
     */
    class func ts_cachesURL() -> NSURL {
        return ts_URLForDirectory(.CachesDirectory)!
    }
    
    /**
     Get String of Caches directory
     
     - returns: Caches directory String
     */
    class func ts_cachesPath() -> String {
        return ts_pathForDirectory(.CachesDirectory)!
    }
    
    /**
     Adds a special filesystem flag to a file to avoid iCloud backup it.
     
     - parameter filePath: Path to a file to set an attribute.
     */
    class func ts_addSkipBackupAttributeToFile(filePath: String) {
        if let url: NSURL = NSURL(fileURLWithPath: filePath) {
            do { try url.setResourceValue(NSNumber(bool: true), forKey: NSURLIsExcludedFromBackupKey) } catch {}
        }
    }
    
    /**
     Check available disk space in MB
     
     - returns: Double in MB
     */
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

