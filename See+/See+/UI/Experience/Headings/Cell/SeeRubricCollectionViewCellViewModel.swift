//
//  SeeRubricCollectionViewCellViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeRubricCollectionViewCellViewModel: QCCollectionCellViewModel {
    
    let name: String
    let unselectedImageName: String
    let selectedImageName: String
    
    // MARK: - Initialization
    
    init(name: String,
         unselectedImageName: String,
         selectedImageName: String) {
        self.name = name
        self.unselectedImageName = unselectedImageName
        self.selectedImageName = selectedImageName
        
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeRubricCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        let height = CGFloat(DeviceHelper.isIpad() ? 100 : 54)
        return CGSize(width: maxSize.width, height: height)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let rubricCell = cell as? SeeRubricCollectionViewCell else {return}
        
        rubricCell.viewModel = self
        rubricCell.rubricLabel.text = self.name
        rubricCell.rubricImageView.image = self.image(selected: rubricCell.isSelected)
    }
    
    // MARK: - Image for selected mode
    
    func image(selected: Bool) -> UIImage? {
        if selected {
            return UIImage(named: self.selectedImageName)
        } else {
            return UIImage(named: self.unselectedImageName)
        }
    }

}
