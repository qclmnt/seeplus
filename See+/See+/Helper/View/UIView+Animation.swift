//
//  UIView+Animation.swift
//  See plus
//
//  Created by Quentin CLEMENT on 17/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func squeezeAndBounce() {
        CSAnimation.class(forAnimationType: CSAnimationTypeMorph).perform(on: self, duration: 0.5, delay: 0)
    }
    
}
