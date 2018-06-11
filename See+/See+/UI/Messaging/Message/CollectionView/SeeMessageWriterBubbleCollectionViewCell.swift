//
//  SeeMessageWriterBubbleCollectionViewCell.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessageWriterBubbleCollectionViewCell: UICollectionViewCell {
    
    // MARK: - View
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var bubbleImageView: UIImageView!
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureLayout()
    }
    
    // MARK: - Configure
    
    func configureLayout() {

    }
    
    // MARK: - Bubble
    
    // Bubble design from: https://github.com/robkerr/TutorialChatBubble
    
    func changeImage(_ name: String) {
        guard let image = UIImage(named: name) else { return }
        self.bubbleImageView.image = image
            .resizableImage(withCapInsets:
                UIEdgeInsetsMake(17, 21, 17, 21),
                            resizingMode: .stretch)
            .withRenderingMode(.alwaysTemplate)
    }

}
