//
//  NSNotificationCenter+TSBlock.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 12/18/15.
//  Copyright © 2015 Hilen. All rights reserved.
//

//https://gist.github.com/brentdax/64845dc0b3fec0a27d87


import Foundation

public extension NSNotificationCenter {
    /**
     NSNotificationCenter with closure
     
     - parameter observer: observer
     - parameter aName:    name
     - parameter anObject: object
     - parameter queue:    queue
     - parameter handler:  the handler
     
     - returns: AnyObject
     */
    func ts_addObserver<T: AnyObject>(observer: T, name aName: String?, object anObject: AnyObject?, queue: NSOperationQueue? = NSOperationQueue.mainQueue(), handler: (observer: T, notification: NSNotification) -> Void) -> AnyObject {
        let observation = addObserverForName(aName, object: anObject, queue: queue) { [unowned observer] note in
            handler(observer: observer, notification: note)
        }
        
        TSObservationRemover(observation).makeRetainedBy(observer)
        
        return observation
    }
}

private class TSObservationRemover: NSObject {
    let observation: NSObjectProtocol
    
    init(_ obs: NSObjectProtocol) {
        observation = obs
        super.init()
    }
    
    func makeRetainedBy(owner: AnyObject) {
        ts_observationRemoversForObject(owner).addObject(self)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(observation)
    }
}

private var TSObservationRemoverKey: UnsafePointer<Void> = nil

private func ts_observationRemoversForObject(object: AnyObject) -> NSMutableArray {
    if TSObservationRemoverKey == nil {
        withUnsafePointer(&TSObservationRemoverKey) { pointer in
            TSObservationRemoverKey = UnsafePointer<Void>(pointer)
        }
    }
    
    var retainedRemovers = objc_getAssociatedObject(object, TSObservationRemoverKey) as! NSMutableArray?
    if retainedRemovers == nil {
        retainedRemovers = NSMutableArray()
        objc_setAssociatedObject(object, TSObservationRemoverKey, retainedRemovers, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    return retainedRemovers!
}




