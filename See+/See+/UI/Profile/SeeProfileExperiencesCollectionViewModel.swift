//
//  SeeProfileExperiencesCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileExperiencesCollectionViewModel: QCCollectionViewModel {
    
    let shouldShowDeleteButton: Bool
    
    // MARK: - Initialization
    
    init(shouldShowDeleteButton: Bool) {
        self.shouldShowDeleteButton = shouldShowDeleteButton
        super.init()
    }
    
    // MARK: - QCCollectionViewModel
    
    override func loadSections() {
        self.sections = [SeeProfileExperiencesSection(shouldShowDeleteButton: self.shouldShowDeleteButton)]
    }

}
