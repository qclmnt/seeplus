//
//  SeeHeadingsCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeHeadingsCollectionViewModel: QCCollectionViewModel {
    
    // MARK: - QCCollectionViewModel
    
    override func loadSections() {
        self.sections = [SeeHeadingsCollectionViewSection()]
    }
    
    // MARK: - Next
    
    func next() {
        // Override in subclasse
    }

    var title: String {
        return ""
    }
}
