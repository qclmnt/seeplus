//
//  SeeFavoritesViewControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeFavoritesViewControllerViewModel: SeeProfileViewControllerViewModel {
    
    // MARK: - SeeTabBarViewControllerViewModel
    
    override var title: String {
        return "Favorites"
    }
    
    override var tabbarItemImage: String {
        return "tabbar-heart"
    }
    
    // MARK: - SeeProfileViewControllerViewModel
    
    override var pageTitle: String {
        return "My crushes"
    }
    
    override var image: String {
        return "crushs"
    }
    
    override var shouldShowLoggedOut: Bool {
        return false
    }

}
