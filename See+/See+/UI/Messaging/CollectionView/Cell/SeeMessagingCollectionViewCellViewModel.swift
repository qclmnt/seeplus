//
//  SeeMessagingCollectionViewCellViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessagingCollectionViewCellViewModel: QCCollectionCellViewModel {
    
    let message: String
    let user: SeeUser
    
    // MARK: - Initialization
    
    init(user: SeeUser, message: String) {
        self.user = user
        self.message = message
        
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeMessagingCollectionViewCell.self)
    }
    
    override var routingEntry: QCRoutingEntry {
        return SeeMessageRoutingEntry(user: self.user)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 115.67)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let messagingCell = cell as? SeeMessagingCollectionViewCell else {return}
        
        messagingCell.usernameLabel.text = self.user.username
        messagingCell.messageLabel.text = self.message
        messagingCell.viewModel = self
    }
    
    // MARK: - Delete
    
    func delete() {
        let deleteMessageRoutingEntry = SeeDeleteExperienceRoutingEntry(viewModel: SeeDeleteMessageViewControllerViewModel())
        QCAppEnvironment.shared().routing?.route(to: deleteMessageRoutingEntry)
    }

}
