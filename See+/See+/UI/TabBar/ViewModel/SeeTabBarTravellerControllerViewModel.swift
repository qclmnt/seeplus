//
//  SeeTabBarTravellerControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeTabBarTravellerControllerViewModel: SeeTabBarResidentControllerViewModel {

    override var viewControllers: [SeeTabBarViewController] {
        return [self.favoritesViewController,
                self.newExperienceViewController,
                self.messagingViewController,
                self.profileViewController]
    }
    
    lazy var favoritesViewController = SeeFavoritesViewController(username: nil)
}
