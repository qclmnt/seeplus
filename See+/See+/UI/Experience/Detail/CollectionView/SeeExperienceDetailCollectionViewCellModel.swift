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
    
    // MARK: - Initialization
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeExperienceDetailCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return maxSize
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let experienceCell = cell as? SeeExperienceDetailCollectionViewCell else {return}
        
        experienceCell.usernameLabel.text = self.experience.author
        experienceCell.experienceNameLabel.text = self.experience.name
        experienceCell.experienceImageView.image = self.experience.image
        experienceCell.experienceLocationLabel.text = self.experience.location
    }

}
