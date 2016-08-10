//
//  UIControl+TSSound.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/10/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension UIControl {
    private struct AssociatedKeys {
        static var ts_soundKey = "ts_soundKey"
    }
    
    public func ts_addSoundName(name: String, forControlEvent controlEvent: UIControlEvents)  {
        let oldSoundKey: String = "\(controlEvent)"
        let oldSound: AVAudioPlayer = self.ts_sounds[oldSoundKey]!
        self.removeTarget(oldSound, action: #selector(AVAudioPlayer.play), forControlEvents: controlEvent)
        do {
            try AVAudioSession.sharedInstance().setCategory("AVAudioSessionCategoryAmbient")
            // Find the sound file.
            guard let soundFileURL = NSBundle.mainBundle().URLForResource(name, withExtension: "") else {
                assert(false, "File not exist")
                return
            }
            
            let tapSound: AVAudioPlayer = try! AVAudioPlayer(contentsOfURL: soundFileURL)
            let controlEventKey: String = "\(controlEvent)"
            var sounds: [NSObject : AnyObject] = self.ts_sounds
            sounds[controlEventKey] = tapSound
            tapSound.prepareToPlay()
            self.addTarget(tapSound, action: #selector(AVAudioPlayer.play), forControlEvents: controlEvent)
        }
        catch _ {}
    }
    
    
    public var ts_sounds: Dictionary<String, AVAudioPlayer> {
        get {
            if let sounds = objc_getAssociatedObject(self, &AssociatedKeys.ts_soundKey) {
                return sounds as! Dictionary<String, AVAudioPlayer>
            }
            
            var sounds = Dictionary() as Dictionary<String, AVAudioPlayer>
            sounds = self.ts_sounds
            return sounds
        }
        set { objc_setAssociatedObject(self, &AssociatedKeys.ts_soundKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)}
    }
}


