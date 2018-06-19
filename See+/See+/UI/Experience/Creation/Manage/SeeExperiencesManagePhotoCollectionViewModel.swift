//
//  SeeExperiencesManagePhotoCollectionViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 17/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperiencesManagePhotoCollectionViewModel: SeeProfileExperiencesCollectionViewModel {
    
    // MARK: - Initialization
    
    init() {
        super.init(shouldShowDeleteButton: true, borderColor: .appRed())
    }
    
    // MARK: - QCCollectionViewModel
    
    override func loadSections() {
        let section1 = QCCollectionViewSection()
        section1.items = [SeeExperienceCreateTitleCollectionViewCellModel(title: NSLocalizedString("manage.photo", comment: ""))]
        
        let section2 = SeeProfileExperiencesSection(shouldShowDeleteButton: self.shouldShowDeleteButton, borderColor: .appRed())
        
        let section3 = SeeManageBottomSection()
        
        self.sections = [section1,section2,section3]
    }

}
