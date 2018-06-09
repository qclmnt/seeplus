//
//  SeeMessageRecipientBubbleCollectionViewCellViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessageRecipientBubbleCollectionViewCellViewModel: SeeMessageWriterBubbleCollectionViewCellViewModel {
    
    // MARK: - SeeMessageWriterBubbleCollectionViewCellViewModel
    
    override var messageBackgroungColor: UIColor {
        return UIColor.appSalmonBackground()
    }
    
    // MARK: - QCCollectionCellViewModel
    
    override var reuseIdentifier: String {
        return String(describing: SeeMessageRecipientBubbleCollectionViewCell.self)
    }

}
