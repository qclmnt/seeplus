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
        self.items = [SeeRubricCollectionViewCellViewModel(name: "Art and Architecture",
                                                           unselectedImageName: "rubric-art",
                                                           selectedImageName: "rubric-art-selected"),
                      SeeRubricCollectionViewCellViewModel(name: "Monuments and Castles",
                                                           unselectedImageName: "rubric-monument",
                                                           selectedImageName: "rubric-monument-selected"),
                      SeeRubricCollectionViewCellViewModel(name: "Green Area",
                                                           unselectedImageName: "rubric-area",
                                                           selectedImageName: "rubric-area-selected"),
                      SeeRubricCollectionViewCellViewModel(name: "Museums and Artiste's house",
                                                           unselectedImageName: "rubric-museum",
                                                           selectedImageName: "rubric-museum-selected"),
                      SeeRubricCollectionViewCellViewModel(name: "Night Life",
                                                           unselectedImageName: "rubric-nightlife",
                                                           selectedImageName: "rubric-nightlife-selected"),
                      SeeRubricCollectionViewCellViewModel(name: "Cinema and Theater",
                                                           unselectedImageName: "rubric-cinema",
                                                           selectedImageName: "rubric-cinema-selected"),]
    }

}
