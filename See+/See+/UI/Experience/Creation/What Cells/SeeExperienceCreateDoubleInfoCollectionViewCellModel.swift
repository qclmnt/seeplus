//
//  SeeExperienceCreateDoubleInfoCollectionViewCellModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateDoubleInfoCollectionViewCellModel: QCCollectionCellViewModel {
    
    // MARK: - SeeExperienceCreateInfoCollectionViewCell
    
    override var reuseIdentifier: String {
        return String(describing: SeeExperienceCreateDoubleInfoCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        let height = CGFloat(DeviceHelper.isIpad() ? 145 : 100)
        return CGSize(width: maxSize.width, height: height)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let createInfoCell = cell as? SeeExperienceCreateDoubleInfoCollectionViewCell else {return}
        
        createInfoCell.infoLabel1.text = NSLocalizedString("postal", comment: "")
        createInfoCell.infoLabel2.text = NSLocalizedString("metrop", comment: "")
    }

}
