//
//  SeeMessageWriterBubbleCollectionViewCellViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessageWriterBubbleCollectionViewCellViewModel: QCCollectionCellViewModel {
    
    var messageBackgroungColor: UIColor {
        return UIColor.appPinkBackground()
    }
    
    var bubbleImageName: String {
        return "chat_bubble_sent"
    }
    
    let message: String
    
    // MARK: - Initialization
    
    init(message: String = "Hello guys") {
        self.message = message
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeMessageWriterBubbleCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 50)
    }

    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let messageCell = cell as? SeeMessageWriterBubbleCollectionViewCell else {return}
        
//        messageCell.messageLabel.backgroundColor = self.messageBackgroungColor
        messageCell.messageLabel.text = self.message
        
        messageCell.changeImage(self.bubbleImageName)
        if #available(iOS 11.0, *) {
            messageCell.bubbleImageView.tintColor = self.messageBackgroungColor
        } else {
            // Fallback on earlier versions
        }
    }
}
