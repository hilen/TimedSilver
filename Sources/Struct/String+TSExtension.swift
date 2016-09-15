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

public extension String {
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
    func ts_stringHeightWithMaxWidth(_ maxWidth: CGFloat, font: UIFont) -> CGFloat {
        let attributes: [String : AnyObject] = [
            NSFontAttributeName: font,
        ]
        let size: CGSize = self.boundingRect(
            with: CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: attributes,
            context: nil
            ).size
        return size.height
    }
    
    /**
     NSRange to Range<String.Index>
     http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index
     
     - parameter range: Range
     
     - returns: NSRange
     */
    
    func ts_NSRange(fromRange range: Range<Index>) -> NSRange {
        let from = range.lowerBound
        let to = range.upperBound
        
        let location = characters.distance(from: startIndex, to: from)
        let length = characters.distance(from: from, to: to)
        
        return NSRange(location: location, length: length)
    }
    
    /** 
     Range<String.Index> to NSRange
     http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index
    
     - parameter nsRange: The NSRange
    
     - returns: Range<String.Index>
    */
    func ts_Range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
}


