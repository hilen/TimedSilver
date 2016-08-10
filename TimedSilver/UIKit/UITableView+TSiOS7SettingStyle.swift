//
//  UITableView+TSiOS7SettingStyle.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/4/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import UIKit


extension UITableView {
    //http://stackoverflow.com/questions/18822619/ios-7-tableview-like-in-settings-app-on-ipad
    /**
     iOS 7 TableView like in Settings App on iPad
     
     - parameter cell:      cell
     - parameter indexPath: indexPath
     */
    func ts_applyiOS7SettingsStyleGrouping(cell: UITableViewCell, indexPath: NSIndexPath) {
        if (!cell.respondsToSelector(Selector("tintColor"))){
            return
        }
        
        let cornerRadius : CGFloat = 12.0
        cell.backgroundColor = UIColor.clearColor()
        let layer: CAShapeLayer = CAShapeLayer()
        let pathRef:CGMutablePathRef = CGPathCreateMutable()
        let bounds: CGRect = CGRectInset(cell.bounds, 25, 0)
        var addLine: Bool = false
        
        if (indexPath.row == 0 && indexPath.row == self.numberOfRowsInSection(indexPath.section)-1) {
            CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius)
        } else if (indexPath.row == 0) {
            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds))
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius)
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius)
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds))
            addLine = true
        } else if (indexPath.row == self.numberOfRowsInSection(indexPath.section)-1) {
            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds))
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius)
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius)
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds))
        } else {
            CGPathAddRect(pathRef, nil, bounds)
            addLine = true
        }
        
        layer.path = pathRef
        layer.fillColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.8).CGColor
        
        if (addLine == true) {
            let lineLayer: CALayer = CALayer()
            let lineHeight: CGFloat = (1.0 / UIScreen.mainScreen().scale)
            lineLayer.frame = CGRectMake(CGRectGetMinX(bounds)+10, bounds.size.height-lineHeight, bounds.size.width-10, lineHeight)
            lineLayer.backgroundColor = self.separatorColor!.CGColor
            layer.addSublayer(lineLayer)
        }
        let testView: UIView = UIView(frame: bounds)
        testView.layer.insertSublayer(layer, atIndex: 0)
        testView.backgroundColor = UIColor.clearColor()
        cell.backgroundView = testView
    }
    
    
}
