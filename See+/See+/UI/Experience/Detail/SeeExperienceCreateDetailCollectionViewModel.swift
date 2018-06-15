//
//  SeeExperienceCreateDetailCollectionViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 15/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateDetailCollectionViewModel: SeeExperienceDetailViewControllerCollectionViewModel {
    
    override var detailSection: SeeExperienceDetailCollectionViewSection {
        return SeeExperienceCreateDetailCollectionViewSection(experience: self.experience)
    }

}
