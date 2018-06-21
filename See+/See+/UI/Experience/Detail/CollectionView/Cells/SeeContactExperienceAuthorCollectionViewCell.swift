//
//  SeeContactExperienceAuthorCollectionViewCell.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeContactExperienceAuthorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton!
    
    var viewModel: SeeContactExperienceAuthorCollectionViewCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.button.layer.masksToBounds = true
        self.button.layer.cornerRadius = self.button.frame.size.height/2
        
        guard let sublayers = self.button.layer.sublayers else {
            return
        }
        for layer in sublayers {
            layer.frame = DeviceHelper.isIpad() ? CGRect(x: 0, y: 0, width: 412, height: 48) : self.button.frame
        }
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        self.viewModel?.routeToMessage()
    }
    
}
