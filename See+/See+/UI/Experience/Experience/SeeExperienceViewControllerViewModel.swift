//
//  SeeExperienceViewControllerViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceViewControllerViewModel: QCViewControllerViewModel {
    
    let experience: SeeExperience
    
    // MARK: - Initialization
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }

}
