//
//  SeeExperienceCreateButtonCollectionViewCell.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateButtonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton!
    
    var gradient: CALayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.gradient = self.button.addHorizontalGradientLayer(leftColor: .appRed(), rightColor: .appPurple())
        self.button.layer.masksToBounds = true

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.button.layer.cornerRadius = (DeviceHelper.isIpad() ? 48 : 30 )/2
        
        guard let layer = self.gradient else {return}
        layer.frame = CGRect(x: 0, y: 0, width: self.button.frame.width, height: (DeviceHelper.isIpad() ? 48 : 30 ))
    }

}
