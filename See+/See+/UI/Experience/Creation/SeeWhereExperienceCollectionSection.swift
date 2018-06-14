//
//  SeeWhereExperienceCollectionSection.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeWhereExperienceCollectionSection: QCCollectionViewSection {
    
    // MARK: - QCCollectionViewSection
    
    override var edgeInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 150, bottom: 0, right: 150)
    }
    
    override func setup() {
        self.items = [SeeExperienceCreateTitleCollectionViewCellModel(title: NSLocalizedString("where", comment: "")),
        SeeExperienceCreateInfoCollectionViewCellModel(title: NSLocalizedString("country", comment: "")),
        SeeExperienceCreateInfoCollectionViewCellModel(title: NSLocalizedString("street", comment: "")),
        SeeExperienceCreateInfoCollectionViewCellModel(title: NSLocalizedString("apt", comment: "")),
        SeeExperienceCreateDoubleInfoCollectionViewCellModel(),
        SeeExperienceCreateButtonCollectionViewCellModel(title: NSLocalizedString("next", comment: ""), routing: SeeExperienceCreateShowRoutingEntry()),
        SeeExperienceCreateButtonCollectionViewCellModel(title: NSLocalizedString("back", comment: ""), routing: SeePopRoutingEntry())]
    }
    
}
