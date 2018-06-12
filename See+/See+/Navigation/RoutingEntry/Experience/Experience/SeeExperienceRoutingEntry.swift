//
//  SeeExperienceRoutingEntry.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceRoutingEntry: QCRoutingEntry {
    
    let experience: SeeExperience
    
    // MARK: - Initialization
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }
    
    // MARK: - QCRoutingEntry
    
    override var viewController: UIViewController? {
        return SeeExperienceViewController(viewModel: SeeExperienceViewControllerViewModel(experience: self.experience))
    }

}
