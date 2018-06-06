//
//  SeeTabBarResidentControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeTabBarResidentControllerViewModel: QCViewControllerViewModel {
    
    var viewControllers: [UINavigationController] {
        return [UINavigationController(rootViewController: self.newExperienceViewController),
                UINavigationController(rootViewController: self.messagingViewController),
                UINavigationController(rootViewController: self.profileViewController)]
    }
    
    lazy var newExperienceViewController = UIViewController()
    lazy var messagingViewController = UIViewController()
    lazy var profileViewController = UIViewController()

}
