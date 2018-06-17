//
//  SeeManageBottomSection.swift
//  See plus
//
//  Created by Quentin CLEMENT on 17/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeManageBottomSection: QCCollectionViewSection {
    
    override var edgeInsets: UIEdgeInsets {
        return UIEdgeInsetsMake(59, 0, 59, 0)
    }
    
    override var minimumLineSpacing: CGFloat {
        return 43
    }
    
    override func setup() {
        self.items = [SeeExperienceCreateButtonApercuCollectionViewCellModel(title: NSLocalizedString("next", comment: ""), routing: SeeExperienceCreateShowRoutingEntry(), shouldShowLayer: true),
                      SeeExperienceCreateButtonApercuCollectionViewCellModel(title: NSLocalizedString("back", comment: ""), routing: SeePopRoutingEntry())]
    }

}
