//
//  UIView+Gradient.swift
//  See+
//
//  Created by Quentin CLEMENT on 10/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addGradientLayer(bottomColor: UIColor, topColor: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [bottomColor.cgColor, topColor.cgColor]
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }
    
    func addHorizontalGradientLayer(leftColor: UIColor, rightColor: UIColor) -> CAGradientLayer {
        let gradientLayer = self.addGradientLayer(bottomColor: leftColor, topColor: rightColor)
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        return gradientLayer
    }
}
