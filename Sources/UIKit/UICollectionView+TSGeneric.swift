//
//  UICollectionView+TSGeneric.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/22/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    // MARK: - Cell register and reuse
    /**
     Register cell nib
     
     - parameter aClass: class
     */
    func ts_registerCellNib<T: UICollectionViewCell>(aClass: T.Type) {
        let name = String(aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.registerNib(nib, forCellWithReuseIdentifier: name)
    }
    
    /**
     Register cell class
     
     - parameter aClass: class
     */
    func ts_registerCellClass<T: UICollectionViewCell>(aClass: T.Type) {
        let name = String(aClass)
        self.registerClass(aClass, forCellWithReuseIdentifier: name)
    }
    
    /**
     Dequeue reusable cell
     
     - parameter aClass:    class
     - parameter indexPath: indexPath
     
     - returns: cell
     */
    func ts_dequeueReusableCell<T: UICollectionViewCell>(aClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T! {
        let name = String(aClass)
        guard let cell = dequeueReusableCellWithReuseIdentifier(name, forIndexPath: indexPath) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }
    
    // MARK: - Header register and reuse
    /**
     Register header nib
     
     - parameter aClass: class
     */
    func ts_registerHeaderNib<T: UICollectionReusableView>(aClass: T.Type) {
        let name = String(aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: name)
    }
    
    /**
     Register header nib
     
     - parameter aClass: class
     */
    func ts_registerHeaderClass<T: UICollectionReusableView>(aClass: T.Type) {
        let name = String(aClass)
        self.registerClass(aClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: name)
    }
    
    /**
     Dequeue reusable header
     
     - parameter aClass:    class
     - parameter indexPath: indexPath
     
     - returns: cell
     */
    func ts_dequeueReusableHeader<T: UICollectionReusableView>(aClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T! {
        let name = String(aClass)
        guard let view = dequeueReusableSupplementaryViewOfKind(
            UICollectionElementKindSectionHeader,
            withReuseIdentifier: name,
            forIndexPath: indexPath) as? T else {
                fatalError("\(name) is not registed")
        }
        return view
    }
    
    // MARK: - Footer register and reuse
    /**
     Register header nib
     
     - parameter aClass: class
     */
    func ts_registerFooterNib<T: UICollectionReusableView>(aClass: T.Type) {
        let name = String(aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: name)
    }
    
    /**
     Register header nib
     
     - parameter aClass: class
     */
    func ts_registerFooterClass<T: UICollectionReusableView>(aClass: T.Type) {
        let name = String(aClass)
        self.registerClass(aClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: name)
    }
    
    /**
     Dequeue reusable header
     
     - parameter aClass:    class
     - parameter indexPath: indexPath
     
     - returns: cell
     */
    func ts_dequeueReusableFooter<T: UICollectionReusableView>(aClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T! {
        let name = String(aClass)
        guard let view = dequeueReusableSupplementaryViewOfKind(
            UICollectionElementKindSectionFooter,
            withReuseIdentifier: name,
            forIndexPath: indexPath) as? T else {
                fatalError("\(name) is not registed")
        }
        return view
    }
}
