//
//  SeeExperienceCreateDetailCollectionViewSection.swift
//  See plus
//
//  Created by Quentin CLEMENT on 15/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateDetailCollectionViewSection: SeeExperienceDetailCollectionViewSection {
    
    override func setup() {
        self.items = [SeeExperienceDetailCollectionViewCellModel(experience: self.experience, showCloseButton: false),
                      SeeTextCollectionViewCellViewModel(text: self.experience.desc),
                      SeeExperienceImage(image: self.experience.image),
                      SeeExperienceImage(image: self.experience.image),
                      SeeExperienceCreateButtonApercuCollectionViewCellModel(title: NSLocalizedString("publish", comment: ""), routing: SeeCongratsRoutingEntry(), shouldShowLayer: true),
                      SeeExperienceCreateButtonApercuCollectionViewCellModel(title: NSLocalizedString("modify", comment: ""), routing: QCRoutingEntry())]
    }

}
