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
    let borderColor: UIColor
    
    // MARK: - Initialization
    
    init(shouldShowDeleteButton: Bool,
         borderColor: UIColor) {
        self.shouldShowDeleteButton = shouldShowDeleteButton
        self.borderColor = borderColor
        super.init()
    }
    
    // MARK: - QCCollectionViewModel
    
    override func loadSections() {
        self.sections = [SeeProfileExperiencesSection(shouldShowDeleteButton: self.shouldShowDeleteButton, borderColor: self.borderColor)]
    }

}
