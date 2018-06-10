//
//  SeeLogOutViewControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeLogOutViewControllerViewModel: SeeDeleteExperienceViewControllerViewModel {
    
    // MARK: - SeeDeleteExperienceViewControllerViewModel
    
    override var title: String {
        return "Do you want to log out ?"
    }
    
    override var actionButtonTitle: String {
        return "log out"
    }
    
    override func action() {
        let signupRoutingEntry = SeeSignupRoutinEntry()
        let navigationController = SeeNavigationController(rootViewController: signupRoutingEntry.viewController ?? UIViewController())
        AppDelegate.shared()?.window??.rootViewController = navigationController
    }

}
