//
//  SeeExperienceCreateTitleCollectionViewCellModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateTitleCollectionViewCellModel: QCCollectionCellViewModel {
    
    let title: String
    
    // MARK: - Initialization
    
    init(title: String) {
        self.title = title
        super.init()
    }
    
    // MARK: - SeeExperienceCreateInfoCollectionViewCell
    
    override var reuseIdentifier: String {
        return String(describing: SeeExperienceCreateTitleCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        let height = CGFloat(DeviceHelper.isIpad() ? 263 : 117)
        return CGSize(width: maxSize.width, height: height)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let createInfoCell = cell as? SeeExperienceCreateTitleCollectionViewCell else {return}
        
        createInfoCell.titleLabel.text = self.title
    }

}
