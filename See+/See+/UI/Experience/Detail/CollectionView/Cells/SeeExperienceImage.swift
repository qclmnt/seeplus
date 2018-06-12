//
//  SeeExperienceImage.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceImage: QCCollectionCellViewModel {
    
    let image: UIImage?
    
    // MARK: - Initialization
    
    init(image: UIImage?) {
        self.image = image
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeExperienceImageCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 630)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let imageCell = cell as? SeeExperienceImageCollectionViewCell else {return}
        
        imageCell.imageView.image = self.image
    }

}
