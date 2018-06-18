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
    @IBOutlet weak var borderView: UIView!
    
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.borderView.layer.borderColor = UIColor.appPurple().cgColor
        self.borderView.layer.borderWidth = DeviceHelper.isIpad() ? 2 : 1
        self.borderView.layer.masksToBounds = true
        self.borderView.layer.cornerRadius = DeviceHelper.isIpad() ? 72 : 46
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.deleteButton.layer.cornerRadius = self.deleteButton.bounds.height/2
    }
    
    // MARK: - Action

    @IBAction func deleteButtonTouchUpInside(_ sender: UIButton) {
        self.deleteButton.setImage(UIImage(named: "deleteSelected"), for: .normal)
        self.viewModel?.deleteExperience()
    }
}
