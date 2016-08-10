//
//  CGSize+TSExtension.swift
//  TimedSilver
//  Source: https://github.com/hilen/TimedSilver
//
//  Created by Hilen on 8/9/16.
//  Copyright © 2016 Hilen. All rights reserved.
//

import UIKit

extension CGSize {
    func ts_aspectFit(boundingSize: CGSize) -> CGSize {
        let minRatio = min(boundingSize.width / width, boundingSize.height / height)
        return CGSize(width: width*minRatio, height: height*minRatio)
    }
}
