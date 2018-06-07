//
//  SeeProfileExperienceCollectionViewCellViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileExperienceCollectionViewCellViewModel: QCCollectionCellViewModel {
    
    let experienceName: String
    let experienceLocation: String
    
    // MARK: - Initialization
    
    init(experienceName: String,
         experienceLocation: String) {
        self.experienceName = experienceName
        self.experienceLocation = experienceLocation
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeProfileExperienceCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 220)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let experienceCell = cell as? SeeProfileExperienceCollectionViewCell else {return}
        
        experienceCell.experienceNameLabel.text = self.experienceName
        experienceCell.experienceLocationLabel.text = self.experienceLocation
    }

}
