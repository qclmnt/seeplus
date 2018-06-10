//
//  SeeProfileExperienceCollectionViewCell.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileExperienceCollectionViewCell: UICollectionViewCell {
    
    var viewModel: SeeProfileExperienceCollectionViewCellViewModel?
    
    // MARK: - Views
    
    @IBOutlet weak var experienceImageView: UIImageView!
    @IBOutlet weak var experienceNameLabel: UILabel!
    @IBOutlet weak var experienceLocationLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.layer.borderColor = UIColor.appPurple().cgColor
        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
    }
    
    // MARK: - Action

    @IBAction func deleteButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel?.deleteExperience()
    }
}
