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
    let textAlignement: NSTextAlignment
    let attributedString: NSAttributedString?
    
    // MARK: - Initialization
    
    init(text: String, textAlignement: NSTextAlignment = .center, attributedString: NSAttributedString? = nil) {
        self.text = text
        self.textAlignement = textAlignement
        self.attributedString = attributedString
        super.init()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeTextCollectionViewCell.self)
    }
    
    override func cellSize(maxSize: CGSize) -> CGSize {
        let height = CGFloat(DeviceHelper.isIpad() ? 200 : 100)
        return CGSize(width: maxSize.width, height: height)
    }
    
    override func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        guard let textCell = cell as? SeeTextCollectionViewCell else {return}
        
        textCell.textLabel.textAlignment = self.textAlignement
        if let attributedText = self.attributedString {
            textCell.textLabel.attributedText = attributedText
        } else {
            let fontSize = CGFloat(DeviceHelper.isIpad() ? 20 : 14)
            textCell.textLabel.attributedText = NSAttributedString(string: self.text, attributes: [NSAttributedStringKey.font: UIFont(name: "Gotham-Book", size: fontSize)!]) 
        }
    }

}
