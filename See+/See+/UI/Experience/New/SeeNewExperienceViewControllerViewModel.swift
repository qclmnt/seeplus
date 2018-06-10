//
//  SeeNewExperienceViewControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeNewExperienceViewControllerViewModel: SeeTabBarViewControllerViewModel {
    
    override var title: String {
        return "Experience"
    }
    
    override var tabbarItemImage: String {
        return "tabbar-map"
    }
    
    // MARK: - Headings
    
    func showHeadings() {
        QCAppEnvironment.shared().routing?.route(to: SeeHeadingsRoutingEntry())
    }

}
