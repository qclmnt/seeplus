//
//  SeeConnectionLoginViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeConnectionLoginViewModel: SeeConnectionSignUpViewModel {

    override var shouldShowConfirmPassword: Bool {
        return false
    }
    
    override var title: String {
        return "Login"
    }
    
    override var switchButtonTitle: String {
        return "Sign up"
    }
    
    override var topBackgroundColor: UIColor {
        return UIColor.appPurple()
    }
    
    override var bottomBackgroundColor: UIColor {
        return UIColor.appRed()
    }
    
    override func switchConnectionMode() {
        AppDelegate.shared()?.window??.rootViewController = SeeSignupRoutinEntry().viewController
    }
}
