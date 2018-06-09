//
//  SeeMessagingListCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessagingListCollectionViewModel: QCCollectionViewModel {
    
    // MARK: - QCCollectionViewModel
    
    override func loadSections() {
        self.sections = [SeeMessagingCollectionViewSection()]
    }

}
