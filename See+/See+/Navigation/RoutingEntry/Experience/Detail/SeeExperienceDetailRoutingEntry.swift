//
//  SeeExperienceDetailRoutingEntry.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceDetailRoutingEntry: QCRoutingEntry {
    
    let viewModel: SeeExperienceDetailViewControllerCollectionViewModel
    
    // MARK: - Initialization
    
    init(viewModel: SeeExperienceDetailViewControllerCollectionViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - QCRoutingEntry
    
    override var viewController: UIViewController? {
        let viewController = SeeExperienceDetailViewController(viewModel: self.viewModel)
        return viewController
    }
    

}
