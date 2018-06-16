//
//  SeeProfileExperiencesSection.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileExperiencesSection: QCCollectionViewSection {
    
    let shouldShowDeleteButton: Bool
    
    // MARK: - Initialization
    
    init(shouldShowDeleteButton: Bool) {
        self.shouldShowDeleteButton = shouldShowDeleteButton
        super.init()
    }
    
    // MARK: - QCCollectionViewSection
    
    override var edgeInsets: UIEdgeInsets {
        return UIEdgeInsetsMake(0, DeviceHelper.isIpad() ? 60 : 10, 0, DeviceHelper.isIpad() ? 60 : 10)
    }
    
    override var numberOfColumns: Int {
        return 2
    }
    
    override var minimumLineSpacing: CGFloat {
        return DeviceHelper.isIpad() ? 20 : 5
    }
    
    override var minimumInteritemSpacing: CGFloat {
        return DeviceHelper.isIpad() ? 60 : 0
    }
    
    override func setup() {
        self.items = [SeeProfileExperienceCollectionViewCellViewModel(experience: SeeExperience(name: "the French Cinémathèque",
                                                                                                location: "75012 Paris",
                                                                                                imageName: "cineFR",
                                                                                                author: "Emmacito"),
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experience: SeeExperience(name: "the French Cinémathèque",
                                                                                                location: "75012 Paris",
                                                                                                imageName: "cineFR",
                                                                                                author: "Emmacito"),
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experience: SeeExperience(name: "the French Cinémathèque",
                                                                                                location: "75012 Paris",
                                                                                                imageName: "cineFR",
                                                                                                author: "Emmacito"),
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experience: SeeExperience(name: "the French Cinémathèque",
                                                                                                location: "75012 Paris",
                                                                                                imageName: "cineFR",
                                                                                                author: "Emmacito"),
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton)]
    }

}
