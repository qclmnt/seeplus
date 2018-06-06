//
//  SeeTabBarTravellerControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeTabBarTravellerControllerViewModel: SeeTabBarResidentControllerViewModel {

    override var viewControllers: [UINavigationController] {
        return [UINavigationController(rootViewController: self.favoritesViewController),
                UINavigationController(rootViewController: self.newExperienceViewController),
                UINavigationController(rootViewController: self.messagingViewController),
                UINavigationController(rootViewController: self.profileViewController)]
    }
    
    lazy var favoritesViewController = UIViewController()
}
