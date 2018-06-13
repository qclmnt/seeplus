//
//  SeeConnectionLoginViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SeeConnectionLoginViewModel: SeeConnectionSignUpViewModel {

    override var shouldShowConfirmPassword: Bool {
        return false
    }
    
    override var title: String {
        return "Login"
    }
    
    override var switchButtonTitle: String {
        return "sign up"
    }
    
    override var topBackgroundColor: UIColor {
        return UIColor.appPurple()
    }
    
    override var bottomBackgroundColor: UIColor {
        return UIColor.appRed()
    }
    
    override func switchConnectionMode() {
        AppDelegate.shared()?.window??.rootViewController = SeeNavigationController(rootViewController: SeeSignupRoutinEntry().viewController ?? UIViewController(), showToolbar: true)
    }
    
    override func validateConnection(usernameText: String?, completion: (Bool) -> ()) {
        
        guard let username = usernameText,
            username.count > 0 else {
                completion(false)
                return
        }
        
        // Verify user existance
        guard let users = Defaults[.usersBase],
            users.contains(username) else {
                completion(false)
                return
        }
        
        completion(true)
        
        // Keep connected user
        Defaults[.connectedUser] = username
        
        // Navigate
        AppDelegate.shared()?.window??.rootViewController = SeeTabBarController(viewModel: SeeTabBarTravellerControllerViewModel())
    }
}
