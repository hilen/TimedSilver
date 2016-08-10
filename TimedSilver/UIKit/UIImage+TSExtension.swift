//
//  UIImage+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 11/24/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

//https://github.com/melvitax/AFImageHelper/blob/master/AFImageHelper/AFImageExtension.swift

import Foundation
import UIKit
import Photos
import QuartzCore
import CoreGraphics
import Accelerate

public extension UIImage {    
    /**
     Applies gradient color overlay to an image.
     
     - parameter gradientColors: An array of colors to use for the gradient
     - parameter blendMode:      The blending type to use
     
     - returns: new image
     */
    func ts_gradientImageWithColors(gradientColors: [UIColor], blendMode: CGBlendMode = CGBlendMode.Normal) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 0, size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        CGContextSetBlendMode(context, blendMode)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        CGContextDrawImage(context, rect, self.CGImage)
        // Create gradient
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = gradientColors.map {(color: UIColor) -> AnyObject! in return color.CGColor as AnyObject! } as NSArray
        let gradient = CGGradientCreateWithColors(colorSpace, colors, nil)
        // Apply gradient
        CGContextClipToMask(context, rect, self.CGImage)
        CGContextDrawLinearGradient(context, gradient, CGPoint(x: 0, y: 0), CGPoint(x: 0, y: size.height), CGGradientDrawingOptions(rawValue: 0))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image;
    }

    
    /**
     Capture screen
     
     - parameter view: view
     - parameter rect: rect
     
     - returns: UIImage
     */
    class func ts_screenCaptureWithView(view: UIView, rect: CGRect) -> UIImage {
        var capture: UIImage
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y)
        //        let layer: CALayer = view.layer
        if view.respondsToSelector(#selector(UIView.drawViewHierarchyInRect(_:afterScreenUpdates:))) {
            view.drawViewHierarchyInRect(view.frame, afterScreenUpdates: true)
        } else {
            view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        }
        capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return capture
    }
    
    /**
     Create UIImage with the color
     
     - parameter color: color
     
     - returns: UIImage
     */
    class func ts_imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0, 0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /**
     The Round corner radius
     
     - parameter cornerRadius: value
     
     - returns: UIImage
     */
    func ts_roundWithCornerRadius(cornerRadius: CGFloat) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        drawInRect(rect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /**
     Check the image has alpha or not
     
     - returns: Bool
     */
    func ts_hasAlpha() -> Bool {
        let alpha: CGImageAlphaInfo = CGImageGetAlphaInfo(self.CGImage)
        return (alpha == .First || alpha == .Last || alpha == .PremultipliedFirst || alpha == .PremultipliedLast)
    }
    
    /**
     Returns a copy of the given image, adding an alpha channel if it doesn't already have one.
     
     - returns: a new image
     */
    func ts_applyAlpha() -> UIImage? {
        if ts_hasAlpha() {
            return self
        }
        
        let imageRef = self.CGImage;
        let width = CGImageGetWidth(imageRef);
        let height = CGImageGetHeight(imageRef);
        let colorSpace = CGImageGetColorSpace(imageRef)
        
        // The bitsPerComponent and bitmapInfo values are hard-coded to prevent an "unsupported parameter combination" error
        let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.ByteOrderDefault.rawValue | CGImageAlphaInfo.PremultipliedFirst.rawValue)
        let offscreenContext = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, bitmapInfo.rawValue)
        
        // Draw the image into the context and retrieve the new image, which will now have an alpha layer
        CGContextDrawImage(offscreenContext, CGRectMake(0, 0, CGFloat(width), CGFloat(height)), imageRef)
        let imageWithAlpha = UIImage(CGImage: CGBitmapContextCreateImage(offscreenContext)!)
        return imageWithAlpha
    }
    
    
    /**
     Creates a new image with a border.
     
     - parameter border: The size of the border.
     - parameter color: The color of the border.
     
     - returns: a new image
     */
    func ts_applyBorder(border:CGFloat, color:UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let width = CGImageGetWidth(self.CGImage)
        let height = CGImageGetHeight(self.CGImage)
        let bits = CGImageGetBitsPerComponent(self.CGImage)
        let colorSpace = CGImageGetColorSpace(self.CGImage)
        let bitmapInfo = CGImageGetBitmapInfo(self.CGImage)
        let context = CGBitmapContextCreate(nil, width, height, bits, 0, colorSpace, bitmapInfo.rawValue)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        CGContextSetRGBStrokeColor(context, red, green, blue, alpha)
        CGContextSetLineWidth(context, border)
        let rect = CGRect(x: 0, y: 0, width: size.width*scale, height: size.height*scale)
        let inset = CGRectInset(rect, border*scale, border*scale)
        CGContextStrokeEllipseInRect(context, inset)
        CGContextDrawImage(context, inset, self.CGImage)
        let image = UIImage(CGImage: CGBitmapContextCreateImage(context)!)
        UIGraphicsEndImageContext()
        return image
    }

    /**
     Applies a blur to an image based on the specified radius, tint color saturation and mask image
     
     - parameter blurRadius: The radius of the blur.
     - parameter tintColor: The optional tint color.
     - parameter saturationDeltaFactor: The detla for saturation.
     - parameter maskImage: The optional image for masking.
     
     - returns: New image or nil
     */
    func ts_applyBlur(blurRadius:CGFloat, tintColor:UIColor?, saturationDeltaFactor:CGFloat, maskImage:UIImage? = nil) -> UIImage? {
        guard size.width > 0 && size.height > 0 && CGImage != nil else {
            return nil
        }
        if maskImage != nil {
            guard maskImage?.CGImage != nil else {
                return nil
            }
        }
        let imageRect = CGRect(origin: CGPointZero, size: size)
        var effectImage = self
        let hasBlur = blurRadius > CGFloat(FLT_EPSILON)
        let hasSaturationChange = fabs(saturationDeltaFactor - 1.0) > CGFloat(FLT_EPSILON)
        if (hasBlur || hasSaturationChange) {
            
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            let effectInContext = UIGraphicsGetCurrentContext()
            CGContextScaleCTM(effectInContext, 1.0, -1.0)
            CGContextTranslateCTM(effectInContext, 0, -size.height)
            CGContextDrawImage(effectInContext, imageRect, CGImage)
            
            var effectInBuffer = vImage_Buffer(
                data: CGBitmapContextGetData(effectInContext),
                height: UInt(CGBitmapContextGetHeight(effectInContext)),
                width: UInt(CGBitmapContextGetWidth(effectInContext)),
                rowBytes: CGBitmapContextGetBytesPerRow(effectInContext))
            
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
            let effectOutContext = UIGraphicsGetCurrentContext()
            
            var effectOutBuffer = vImage_Buffer(
                data: CGBitmapContextGetData(effectOutContext),
                height: UInt(CGBitmapContextGetHeight(effectOutContext)),
                width: UInt(CGBitmapContextGetWidth(effectOutContext)),
                rowBytes: CGBitmapContextGetBytesPerRow(effectOutContext))
            
            if hasBlur {
                let inputRadius = blurRadius * UIScreen.mainScreen().scale
                var radius = UInt32(floor(inputRadius * 3.0 * CGFloat(sqrt(2.0 * M_PI)) / 4.0 + 0.5))
                if radius % 2 != 1 {
                    radius += 1 // force radius to be odd so that the three box-blur methodology works.
                }
                let imageEdgeExtendFlags = vImage_Flags(kvImageEdgeExtend)
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
            }
            
            var effectImageBuffersAreSwapped = false
            
            if hasSaturationChange {
                let s: CGFloat = saturationDeltaFactor
                let floatingPointSaturationMatrix: [CGFloat] = [
                    0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                    0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                    0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                    0,                    0,                    0,  1
                ]
                
                let divisor: CGFloat = 256
                let matrixSize = floatingPointSaturationMatrix.count
                var saturationMatrix = [Int16](count: matrixSize, repeatedValue: 0)
                
                for i: Int in 0 ..< matrixSize {
                    saturationMatrix[i] = Int16(round(floatingPointSaturationMatrix[i] * divisor))
                }
                
                if hasBlur {
                    vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                    effectImageBuffersAreSwapped = true
                } else {
                    vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                }
            }
            
            if !effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()
            }
            
            UIGraphicsEndImageContext()
            
            if effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()
            }
            
            UIGraphicsEndImageContext()
        }
        
        // Set up output context.
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        let outputContext = UIGraphicsGetCurrentContext()
        CGContextScaleCTM(outputContext, 1.0, -1.0)
        CGContextTranslateCTM(outputContext, 0, -size.height)
        
        // Draw base image.
        CGContextDrawImage(outputContext, imageRect, self.CGImage)
        
        // Draw effect image.
        if hasBlur {
            CGContextSaveGState(outputContext)
            if let image = maskImage {
                CGContextClipToMask(outputContext, imageRect, image.CGImage);
            }
            CGContextDrawImage(outputContext, imageRect, effectImage.CGImage)
            CGContextRestoreGState(outputContext)
        }
        
        // Add in color tint.
        if let color = tintColor {
            CGContextSaveGState(outputContext)
            CGContextSetFillColorWithColor(outputContext, color.CGColor)
            CGContextFillRect(outputContext, imageRect)
            CGContextRestoreGState(outputContext)
        }
        
        // Output image is ready.
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return outputImage
        
    }
}

