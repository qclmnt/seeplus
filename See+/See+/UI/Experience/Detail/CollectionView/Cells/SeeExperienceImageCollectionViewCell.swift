//
//  SeeExperienceImageCollectionViewCell.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = 80
    }

}
