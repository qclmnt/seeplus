//
//  SeeExperienceCreateInfoCollectionViewCellModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateInfoCollectionViewCellModel: QCCollectionCellViewModel {
    
    let title: String
    
    // MARK: - Initialization
    
    init(title: String) {
        self.title = title
        super.init()
    }

    // MARK: - SeeExperienceCreateInfoCollectionViewCell
    
    override var reuseIdentifier: String {
        return String(describing: SeeExperienceCreateInfoCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 80)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let createInfoCell = cell as? SeeExperienceCreateInfoCollectionViewCell else {return}
        
        createInfoCell.titleLabel.text = self.title
    }
}
