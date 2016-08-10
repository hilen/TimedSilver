//
//  UILabel+Extension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 1/19/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    /**
     The content size of UILabel
     
     - returns: CGSize
     */
    func ts_contentSize() -> CGSize {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = self.lineBreakMode
        paragraphStyle.alignment = self.textAlignment
        let attributes: [String : AnyObject] = [NSFontAttributeName: self.font, NSParagraphStyleAttributeName: paragraphStyle]
        let contentSize: CGSize = self.text!.boundingRectWithSize(
            self.frame.size,
            options: ([.UsesLineFragmentOrigin, .UsesFontLeading]),
            attributes: attributes,
            context: nil
        ).size
        return contentSize
    }
    
    /**
     Set UILabel's frame with the string, and limit the width.
     
     - parameter string: text
     - parameter width:  your limit width
     */
    func ts_setFrameWithString(string: String, width: CGFloat) {
        self.numberOfLines = 0
        let attributes: [String : AnyObject] = [
            NSFontAttributeName: self.font,
        ]
        let resultSize: CGSize = string.boundingRectWithSize(
            CGSize(width: width, height: CGFloat.max),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: attributes,
            context: nil
        ).size
        let resultHeight: CGFloat = resultSize.height
        let resultWidth: CGFloat = resultSize.width
        var frame: CGRect = self.frame
        frame.size.height = resultHeight
        frame.size.width = resultWidth
        self.frame = frame
    }
}



