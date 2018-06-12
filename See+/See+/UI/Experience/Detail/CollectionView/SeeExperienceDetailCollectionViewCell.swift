//
//  SeeExperienceDetailCollectionViewCell.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var experienceView: UIView!
    @IBOutlet weak var experienceNameLabel: UILabel!
    @IBOutlet weak var experienceLocationLabel: UILabel!
    @IBOutlet weak var experienceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.experienceView.layer.masksToBounds = true
        self.experienceView.layer.cornerRadius = 80
    }

}
