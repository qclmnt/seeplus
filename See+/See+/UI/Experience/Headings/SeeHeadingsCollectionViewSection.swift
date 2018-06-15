//
//  SeeHeadingsCollectionViewSection.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeHeadingsCollectionViewSection: QCCollectionViewSection {
    
    // MARK: - QCCollectionViewSection
    
    override func setup() {
        self.items = [SeeRubricCollectionViewCellViewModel(name: NSLocalizedString("art", comment: ""),
                                                           unselectedImageName: "rubric-art",
                                                           selectedImageName: "rubric-art-selected"),
                      SeeRubricCollectionViewCellViewModel(name: NSLocalizedString("monuments", comment: ""),
                                                           unselectedImageName: "rubric-monument",
                                                           selectedImageName: "rubric-monument-selected"),
                      SeeRubricCollectionViewCellViewModel(name: NSLocalizedString("green", comment: ""),
                                                           unselectedImageName: "rubric-area",
                                                           selectedImageName: "rubric-area-selected"),
                      SeeRubricCollectionViewCellViewModel(name: NSLocalizedString("museum", comment: ""),
                                                           unselectedImageName: "rubric-museum",
                                                           selectedImageName: "rubric-museum-selected"),
                      SeeRubricCollectionViewCellViewModel(name: NSLocalizedString("nightlife", comment: ""),
                                                           unselectedImageName: "rubric-nightlife",
                                                           selectedImageName: "rubric-nightlife-selected"),
                      SeeRubricCollectionViewCellViewModel(name: NSLocalizedString("cinema", comment: ""),
                                                           unselectedImageName: "rubric-cinema",
                                                           selectedImageName: "rubric-cinema-selected"),]
    }

}
