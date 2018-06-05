//
//  SeeConnectionSignUpViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeConnectionSignUpViewModel: QCViewControllerViewModel {
    
    var shouldShowConfirmPassword: Bool {
        return true
    }
    
    var title: String {
        return "Sign up"
    }
    
    var switchButtonTitle: String {
        return "Login"
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
    }
    
    func switchConnectionMode() {
        AppDelegate.shared()?.window??.rootViewController = SeeLoginRoutinEntry().viewController
    }

}
