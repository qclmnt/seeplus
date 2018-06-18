//
//  SeeExperienceCreateInfoCollectionViewCell.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateInfoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: SeeTextField!
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.configureWithStyle1(color: .appRed(), border: DeviceHelper.isIpad() ? 2 : 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textField.layer.cornerRadius = (DeviceHelper.isIpad() ? 48 : 30)/2
    }

}
