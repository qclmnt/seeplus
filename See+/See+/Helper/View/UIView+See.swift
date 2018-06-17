//
//  UIView+See.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

extension UIView {
    
    func configureWithStyle1(color: UIColor, border: CGFloat = 1) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = border
    }
}
