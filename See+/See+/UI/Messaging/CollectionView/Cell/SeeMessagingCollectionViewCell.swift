//
//  SeeMessagingCollectionViewCell.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessagingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    lazy var color = SeeMode.activatedMode() == .propose ? UIColor.appPurple() : UIColor.appRed()
    
    var bottomLine: CALayer?
    
    var viewModel: SeeMessagingCollectionViewCellViewModel?
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        self.usernameLabel.text = "Emmanuel Macron"
        self.usernameLabel.textColor = self.color
        self.messageLabel.text = "Paris c'est la plus belle ville du monde !"
        self.messageLabel.textColor = self.color
        
        self.bottomLine = self.addBottomBorder(color: self.color, borderWidth: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let bottomLine = self.bottomLine else {return}
        bottomLine.frame = CGRect(x: bottomLine.frame.origin.x, y: self.frame.height - bottomLine.frame.height, width: self.frame.width, height: bottomLine.frame.height)
    }
    
    // MARK: - Action

    @IBAction func deleteButtonTouchUpInside(_ sender: UIButton) {
        self.deleteButton.setImage(UIImage(named: "deleteSelected"), for: .normal)
        self.viewModel?.delete()
    }
}
