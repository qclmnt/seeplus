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
                                                           unselectedImageName: "",
                                                           selectedImageName: ""),
                      SeeRubricCollectionViewCellViewModel(name: "Monuments and Castles",
                                                           unselectedImageName: "",
                                                           selectedImageName: ""),
                      SeeRubricCollectionViewCellViewModel(name: "Green Area",
                                                           unselectedImageName: "",
                                                           selectedImageName: ""),
                      SeeRubricCollectionViewCellViewModel(name: "Museums and Artiste's house",
                                                           unselectedImageName: "",
                                                           selectedImageName: ""),
                      SeeRubricCollectionViewCellViewModel(name: "Night Life",
                                                           unselectedImageName: "",
                                                           selectedImageName: ""),
                      SeeRubricCollectionViewCellViewModel(name: "Cinema and Theater",
                                                           unselectedImageName: "",
                                                           selectedImageName: ""),]
    }

}
