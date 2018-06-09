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
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureLayout()
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        self.messageLabel.backgroundColor = UIColor.appPinkBackground()
        self.messageLabel.layer.borderColor = UIColor.appPurple().cgColor
        self.messageLabel.layer.cornerRadius = self.messageLabel.frame.size.height / 2
        self.messageLabel.layer.masksToBounds = true
    }

}
