//
//  UIButton+See.swift
//  See+
//
//  Created by Quentin CLEMENT on 10/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    /*
     * Texte: white
     * Background: gradient
     */
    func configureWithStyle1() {
        
        self.layer.masksToBounds = true
        self.setTitleColor(.white, for: .normal)
        let _ = self.addHorizontalGradientLayer(leftColor: .appRed(), rightColor: .appPurple())
    }
    
}
