//
//  SeeExperienceDetailCollectionViewSection.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceDetailCollectionViewSection: QCCollectionViewSection {
    
    let experience: SeeExperience
    
    // MARK: - Initialization
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }
    
    // MARK: - QCCollectionViewSection
    
    override func setup() {
        self.items = [SeeExperienceDetailCollectionViewCellModel(experience: self.experience),
        SeeTextCollectionViewCellViewModel(text: self.experience.desc),
        SeeExperienceImage(image: self.experience.image),
        SeeExperienceImage(image: self.experience.image),
        SeeContactExperienceAuthorCollectionViewCellViewModel(experience: self.experience),
        SeeTextCollectionViewCellViewModel(text: self.experience.desc)]
    }

}
