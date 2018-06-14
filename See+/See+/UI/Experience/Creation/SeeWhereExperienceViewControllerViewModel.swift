//
//  SeeWhereExperienceViewControllerViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeWhereExperienceViewControllerViewModel: QCCollectionViewModel {
    
    // MARK: - QCCollectionViewModel
    
    override func loadSections() {
        self.sections = [SeeWhereExperienceCollectionSection()]
    }

}
