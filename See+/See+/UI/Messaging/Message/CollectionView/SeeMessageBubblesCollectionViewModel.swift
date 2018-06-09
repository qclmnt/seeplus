//
//  SeeMessageBubblesCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessageBubblesCollectionViewModel: QCCollectionViewModel {
    
    // MARK: - QCCollectionViewModel
    
    override func load() {
        self.delegate?.viewModelDidStartLoad()
        self.loadSections()
        self.delegate?.viewModelDidLoad()
    }
    
    func loadSections() {
        self.sections = [SeeMessageBubblesCollectionViewSection()]
    }

}
