//
//  UITableView+TSGeneric.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

public extension UITableView {
    // MARK: - Cell register and reuse
    /**
     Register cell nib
     
     - parameter aClass: class
     */
    func ts_registerCellNib<T: UITableViewCell>(aClass: T.Type) {
        let name = String(aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.registerNib(nib, forCellReuseIdentifier: name)
    }
    
    /**
     Register cell class
     
     - parameter aClass: class
     */
    func ts_registerCellClass<T: UITableViewCell>(aClass: T.Type) {
        let name = String(aClass)
        self.registerClass(aClass, forCellReuseIdentifier: name)
    }
    
    /**
     Reusable Cell
     
     - parameter aClass:    class
     
     - returns: cell
     */
    func ts_dequeueReusableCell<T: UITableViewCell>(aClass: T.Type) -> T! {
        let name = String(aClass)
        guard let cell = dequeueReusableCellWithIdentifier(name) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }
    
    // MARK: - HeaderFooter register and reuse
    /**
     Register cell nib
     
     - parameter aClass: class
     */
    func ts_registerHeaderFooterNib<T: UIView>(aClass: T.Type) {
        let name = String(aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.registerNib(nib, forHeaderFooterViewReuseIdentifier: name)
    }
    
    /**
     Register cell class
     
     - parameter aClass: class
     */
    func ts_registerHeaderFooterClass<T: UIView>(aClass: T.Type) {
        let name = String(aClass)
        self.registerClass(aClass, forHeaderFooterViewReuseIdentifier: name)
    }
    
    /**
     Reusable Cell
     
     - parameter aClass:    class
     
     - returns: cell
     */
    func ts_dequeueReusableHeaderFooter<T: UIView>(aClass: T.Type) -> T! {
        let name = String(aClass)
        guard let cell = dequeueReusableHeaderFooterViewWithIdentifier(name) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }

}