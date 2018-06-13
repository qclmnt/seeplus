//
//  SeeExperienceDetailViewControllerCollectionViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceDetailViewControllerCollectionViewModel: QCCollectionViewModel {
    
    let experience: SeeExperience
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }
    
    override func loadSections() {
        self.sections = [SeeExperienceDetailCollectionViewSection(experience: self.experience)]
    }

}
