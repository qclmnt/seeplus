//
//  SeeExperienceDetailCollectionViewCellModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceDetailCollectionViewCellModel: QCCollectionCellViewModel {
    
    let experience: SeeExperience
    let showCloseButton: Bool
    
    // MARK: - Initialization
    
    init(experience: SeeExperience, showCloseButton: Bool = true) {
        self.experience = experience
        self.showCloseButton = showCloseButton
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeExperienceDetailCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 780)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let experienceCell = cell as? SeeExperienceDetailCollectionViewCell else {return}
        
        experienceCell.usernameLabel.text = self.showCloseButton ? self.experience.author: NSLocalizedString("quickview", comment: "")
        experienceCell.experienceNameLabel.text = self.experience.name
        experienceCell.experienceImageView.image = self.experience.image
        experienceCell.experienceLocationLabel.text = self.experience.location
        experienceCell.closeButton.isHidden = !self.showCloseButton
    }

}
