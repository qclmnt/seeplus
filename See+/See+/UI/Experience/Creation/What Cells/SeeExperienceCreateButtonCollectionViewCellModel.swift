//
//  SeeExperienceCreateButtonCollectionViewCellModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateButtonCollectionViewCellModel: QCCollectionCellViewModel {
    
    let title: String
    
    // MARK: - Initialization
    
    init(title: String) {
        self.title = title
        super.init()
    }
    
    // MARK: - SeeExperienceCreateInfoCollectionViewCell
    
    override var reuseIdentifier: String {
        return String(describing: SeeExperienceCreateButtonCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 300)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let createInfoCell = cell as? SeeExperienceCreateButtonCollectionViewCell else {return}
        
        createInfoCell.button.setTitle(self.title, for: .normal)
    }

}
