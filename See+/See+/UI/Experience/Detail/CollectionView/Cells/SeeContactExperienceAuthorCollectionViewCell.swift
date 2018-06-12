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
        
        self.button.configureWithStyle1()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.button.layer.masksToBounds = true
        self.button.layer.cornerRadius = self.button.frame.size.height/2
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        self.viewModel?.routeToMessage()
    }
    
}
