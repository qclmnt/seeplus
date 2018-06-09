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
        return UIEdgeInsetsMake(0, 60, 0, 60)
    }
    
    override var numberOfColumns: Int {
        return 2
    }
    
    override var minimumLineSpacing: CGFloat {
        return 20
    }
    
    override var minimumInteritemSpacing: CGFloat {
        return 60
    }
    
    override func setup() {
        self.items = [SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Tour Eiffel",
                                                                      experienceLocation: "Paris",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Empire State Building",
                                                                      experienceLocation: "New York",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Golden Gate",
                                                                      experienceLocation: "San Francisco",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Louvre",
                                                                      experienceLocation: "Paris",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Picadilly Circus",
                                                                      experienceLocation: "London",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Tour Eiffel",
                                                                      experienceLocation: "Paris",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Tour Eiffel",
                                                                      experienceLocation: "Paris",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Empire State Building",
                                                                      experienceLocation: "New York",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Golden Gate",
                                                                      experienceLocation: "San Francisco",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Louvre",
                                                                      experienceLocation: "Paris",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Picadilly Circus",
                                                                      experienceLocation: "London",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton),
                      SeeProfileExperienceCollectionViewCellViewModel(experienceName: "Tour Eiffel",
                                                                      experienceLocation: "Paris",
                                                                      shouldShowDeleteButton: self.shouldShowDeleteButton)]
    }

}
