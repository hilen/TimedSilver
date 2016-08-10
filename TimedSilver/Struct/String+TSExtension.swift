//
//  String+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 1/19/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /// String's length
    var ts_length: Int {
        return self.characters.count
    }
    
    /**
     Calculate the height of string, and limit the width
     
     - parameter maxWidth: width
     - parameter font:     font
     
     - returns: height value
     */
    func ts_stringHeightWithMaxWidth(maxWidth: CGFloat, font: UIFont) -> CGFloat {
        let attributes: [String : AnyObject] = [
            NSFontAttributeName: font,
        ]
        let size: CGSize = self.boundingRectWithSize(
            CGSize(width: maxWidth, height: CGFloat.max),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: attributes,
            context: nil
            ).size
        return size.height
    }
    
    /**
     Get NSRange from Range
     
     - parameter aRange: Range
     
     - returns: NSRange
     */
    func ts_NSRangeFromRange(aRange : Range<String.Index>) -> NSRange {
        let utf16view = self.utf16
        let from = String.UTF16View.Index(aRange.startIndex, within: utf16view)
        let to = String.UTF16View.Index(aRange.endIndex, within: utf16view)
        return NSMakeRange(utf16view.startIndex.distanceTo(from), from.distanceTo(to))
    }
    
    /**
     Get Range from NSRange
     
     - parameter aNSRange: NSRange
     
     - returns: Range
     */
    func ts_RangeFromNSRange(aNSRange : NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(aNSRange.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(aNSRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
    
    
}


