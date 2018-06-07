//
//  SeeMessagingListCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessagingListCollectionViewModel: QCCollectionViewModel {
    
    var delegate: QCViewModelDelegate?
    
    // MARK: - QCCollectionViewModel
    
    override func load() {
        self.delegate?.viewModelDidStartLoad()
        self.loadSections()
        self.delegate?.viewModelDidLoad()
    }
    
    func loadSections() {
        self.sections = [SeeMessagingCollectionViewSection()]
    }

}
