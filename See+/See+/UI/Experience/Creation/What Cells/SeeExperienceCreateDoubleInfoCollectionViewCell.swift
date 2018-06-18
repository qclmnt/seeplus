//
//  SeeExperienceCreateDoubleInfoCollectionViewCell.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateDoubleInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var infoLabel1: UILabel!
    @IBOutlet weak var infoLabel2: UILabel!
    @IBOutlet weak var infoTextflied1: SeeTextField!
    @IBOutlet weak var infoTextField2: SeeTextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.infoTextflied1.configureWithStyle1(color: .appRed(), border: DeviceHelper.isIpad() ? 2 : 1)
        self.infoTextField2.configureWithStyle1(color: .appRed(), border: DeviceHelper.isIpad() ? 2 : 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.infoTextflied1.layer.cornerRadius = (DeviceHelper.isIpad() ? 48 : 30 )/2
        self.infoTextField2.layer.cornerRadius = (DeviceHelper.isIpad() ? 48 : 30 )/2
    }

}
