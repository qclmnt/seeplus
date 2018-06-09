//
//  SeeMessageBubblesCollectionViewSection.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessageBubblesCollectionViewSection: QCCollectionViewSection {
    
    // MARK: - QCCollectionViewSection
    
    override func setup() {
        self.items = [SeeMessageWriterBubbleCollectionViewCellViewModel(),
                      SeeMessageWriterBubbleCollectionViewCellViewModel(),
                      SeeMessageWriterBubbleCollectionViewCellViewModel()]
    }

}
