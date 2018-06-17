//
//  SeeTabBarResidentControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeTabBarResidentControllerViewModel: QCViewControllerViewModel {
    
    var viewControllers: [SeeTabBarViewController] {
        return [self.newExperienceViewController,
                self.messagingViewController,
                self.profileViewController]
    }
    
    lazy var newExperienceViewController = SeeNewExperienceViewController()
    lazy var messagingViewController = SeeMessagingViewController()
    lazy var profileViewController = SeeProfileViewController(username: nil)

}
