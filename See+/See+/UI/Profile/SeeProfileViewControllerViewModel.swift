//
//  SeeProfileViewControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileViewControllerViewModel: SeeTabBarViewControllerViewModel {
    
    // MARK: - SeeTabBarViewControllerViewModel
    
    override var title: String {
        return "profile"
    }
    
    override var tabbarItemImage: String {
        return "tabbar-profile"
    }
    
    // MARK: - Layout
    
    var pageTitle: String {
        return "My traveler profile"
    }
    
    var image: String {
        return "myprofile"
    }
    
    var shouldShowLoggedOut: Bool {
        return true
    }
    
    var shouldShowDeleteButtonOnExperience: Bool {
        return !self.shouldShowLoggedOut
    }
    
    // MARK: - Action
    
    func logOut() {
        QCAppEnvironment.shared().routing?.route(to: SeeDeleteExperienceRoutingEntry(viewModel: SeeLogOutViewControllerViewModel()))
    }

}
