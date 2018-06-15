//
//  SeeCongratsViewControllerViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 15/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeCongratsViewControllerViewModel: SeeWelcomeViewControllerViewModel {
    
    override var title: String {
        return NSLocalizedString("congrat", comment: "")
    }
    
    override var info: String {
        return NSLocalizedString("available", comment: "")
    }
    
    override var buttonTitle: String {
        return NSLocalizedString("see", comment: "")
    }
    
    override func buttonAction() {
        AppDelegate.seeShared()?.buildRoot()
    }

}
