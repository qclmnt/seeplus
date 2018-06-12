//
//  SeeExperienceDetailRoutingEntry.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceDetailRoutingEntry: QCRoutingEntry {
    
    let experience: SeeExperience
    
    // MARK: - Initialization
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }
    
    // MARK: - QCRoutingEntry
    
    override var navigationStyle: QCNavigationStyle {
        return .modal
    }
    
    override var viewController: UIViewController? {
        return SeeNavigationController(rootViewController: SeeExperienceDetailViewController(experience: self.experience), showToolbar: false)
//        return SeeExperienceDetailViewController(experience: self.experience)
    }
    

}
