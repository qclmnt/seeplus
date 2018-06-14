//
//  UIView+Border.swift
//  See+
//
//  Created by Quentin CLEMENT on 10/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addBottomBorder(color: UIColor, borderWidth: CGFloat) -> CALayer {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: borderWidth)
        self.layer.addSublayer(border)
        return border
    }

}
