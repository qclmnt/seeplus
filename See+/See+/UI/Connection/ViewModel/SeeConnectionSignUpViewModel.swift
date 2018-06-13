//
//  SeeConnectionSignUpViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SeeConnectionSignUpViewModel: QCViewControllerViewModel {
    
    var shouldShowConfirmPassword: Bool {
        return true
    }
    
    var title: String {
        return "Sign up"
    }
    
    var switchButtonTitle: String {
        return "login"
    }
    
    var topBackgroundColor: UIColor {
        return UIColor.appRed()
    }
    
    var bottomBackgroundColor: UIColor {
        return UIColor.appPurple()
    }
    
    // MARK: - Actions
    
    func validateConnection(usernameText: String?, completion: (_ succeded: Bool)->()) {
        guard let username = usernameText,
            username.count > 0 else {
            completion(false)
            return
        }
        
        print("Username \(username)")
        completion(true)
        
        // Navigate
        QCAppEnvironment.shared().routing?.route(to: SeeProfilePicRoutingEntry())
        
        // Save user to base
        Defaults[.usersBase]?.append(username)
        
        // Keep connected user
        Defaults[.connectedUser] = username
    }
    
    func switchConnectionMode() {
        AppDelegate.shared()?.window??.rootViewController = SeeNavigationController(rootViewController: SeeLoginRoutinEntry().viewController ?? UIViewController(), showToolbar: true)
    }

}
