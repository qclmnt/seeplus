//
//  SeeContactExperienceAuthorCollectionViewCellViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeContactExperienceAuthorCollectionViewCellViewModel: QCCollectionCellViewModel {
    
    let experience: SeeExperience
    
    // MARK: - Initialization
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel

    override var reuseIdentifier: String {
        return String(describing: SeeContactExperienceAuthorCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        let width = CGFloat(DeviceHelper.isIpad() ? maxSize.width : 243)
        let height = CGFloat(DeviceHelper.isIpad() ? 70 : 32)
        return CGSize(width: width, height: height)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let contactCell = cell as? SeeContactExperienceAuthorCollectionViewCell else {return}
        
        contactCell.viewModel = self
        contactCell.button.setTitleColor(.white, for: .normal)
        contactCell.button.setTitle("contact me", for: .normal)
    }
    
    // MARK: - Action
    
    func routeToMessage() {
        QCAppEnvironment.shared().routing?.route(to: SeeMessageRoutingEntry(user: self.experience.user))
    }
    
}
