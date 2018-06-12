//
//  SeeTextCollectionViewCellViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeTextCollectionViewCellViewModel: QCCollectionCellViewModel {
    
    let text: String
    
    // MARK: - Initialization
    
    init(text: String) {
        self.text = text
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeTextCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 400)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let textCell = cell as? SeeTextCollectionViewCell else {return}
        
        textCell.textLabel.text = self.text
    }

}
