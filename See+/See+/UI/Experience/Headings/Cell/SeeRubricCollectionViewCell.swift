//
//  SeeRubricCollectionViewCell.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeRubricCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    @IBOutlet weak var rubricImageView: UIImageView!
    @IBOutlet weak var rubricLabel: UILabel!
    
    var gradientLayer: CAGradientLayer?
    var bottomLine: CALayer?
    var viewModel: SeeRubricCollectionViewCellViewModel?
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        self.bottomLine = self.addBottomBorder(color: .appRed(), borderWidth: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let bottomLine = self.bottomLine else {return}
        bottomLine.frame = CGRect(x: 0, y: self.frame.height-bottomLine.frame.height, width: self.frame.width, height: bottomLine.frame.height)
    }
    
    // MARK: - UICollectionViewCell
    
    override var isSelected: Bool {
        didSet {
            self.rubricImageView.image = self.viewModel?.image(selected: self.isSelected)
            if self.isSelected {
                self.gradientLayer = self.addHorizontalGradientLayer(leftColor: .appRed(), rightColor: .appPurple())
                self.rubricLabel.textColor = .white
                if let bottomLine = self.bottomLine {
                    bottomLine.backgroundColor = UIColor.white.cgColor
                }
            } else {
                self.rubricLabel.textColor = .appRed()
                self.gradientLayer?.removeFromSuperlayer()
                self.gradientLayer = nil
                if let bottomLine = self.bottomLine {
                    bottomLine.backgroundColor = UIColor.appRed().cgColor
                }
            }
        }
    }

}
