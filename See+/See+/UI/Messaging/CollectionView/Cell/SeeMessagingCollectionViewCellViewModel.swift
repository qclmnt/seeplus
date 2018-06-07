//
//  SeeMessagingCollectionViewCellViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessagingCollectionViewCellViewModel: QCCollectionCellViewModel {
    
    let username: String
    let message: String
    
    // MARK: - Initialization
    
    init(username: String, message: String) {
        self.username = username
        self.message = message
        
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeMessagingCollectionViewCell.self)
    }
    
    override var routingEntry: QCRoutingEntry {
        return QCRoutingEntry()
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 80)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let messagingCell = cell as? SeeMessagingCollectionViewCell else {return}
        
        messagingCell.usernameLabel.text = self.username
        messagingCell.messageLabel.text = self.message
    }

}
