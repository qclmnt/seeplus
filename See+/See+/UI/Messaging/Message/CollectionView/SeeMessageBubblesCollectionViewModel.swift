//
//  SeeMessageBubblesCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessageBubblesCollectionViewModel: QCCollectionViewModel {
    
    lazy var messageSection = SeeMessageBubblesCollectionViewSection()
    
    // MARK: - QCCollectionViewModel
    
    override func loadSections() {
        self.sections = [self.messageSection]
    }
    
    // MARK: - New message
    
    func addMessage(message: String) {
        self.messageSection.items.append(SeeMessageWriterBubbleCollectionViewCellViewModel(message: message))
    }

}
