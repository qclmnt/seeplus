//
//  SeeProfileExperienceCollectionViewCellViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileExperienceCollectionViewCellViewModel: QCCollectionCellViewModel {
    
    let experience: SeeExperience
    let shouldShowDeleteButton: Bool
    
    // MARK: - Initialization
    
    init(experience: SeeExperience,
         shouldShowDeleteButton: Bool) {
        self.shouldShowDeleteButton = shouldShowDeleteButton
        self.experience = experience
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeProfileExperienceCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 334)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let experienceCell = cell as? SeeProfileExperienceCollectionViewCell else {return}
        
        experienceCell.experienceNameLabel.text = self.experience.name
        experienceCell.experienceLocationLabel.text = self.experience.location
        experienceCell.deleteButton.isHidden = !self.shouldShowDeleteButton
        experienceCell.experienceImageView.image = self.experience.image
        experienceCell.viewModel = self
    }
    
    override var routingEntry: QCRoutingEntry {
        return SeeExperienceRoutingEntry(experience: self.experience)
    }
    
    // MARK: Delete action
    
    func deleteExperience() {
        QCAppEnvironment.shared().routing?.route(to: SeeDeleteExperienceRoutingEntry(viewModel: SeeDeleteExperienceViewControllerViewModel()))
    }

}
