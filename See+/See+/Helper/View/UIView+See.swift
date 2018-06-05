//
//  UIView+See.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

extension UIView {
    
    func addGradientLayer(bottomColor: UIColor, topColor: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [bottomColor.cgColor, topColor.cgColor]
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }
}
