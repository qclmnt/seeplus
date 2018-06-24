//
//  SeeCongratsViewControllerViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 15/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SeeCongratsViewControllerViewModel: SeeWelcomeViewControllerViewModel {
    
    override var title: String {
        return String(format:NSLocalizedString("congrat", comment: ""), Defaults[.connectedUser] ?? "error")
    }
    
    override var info: String {
        return NSLocalizedString("available", comment: "")
    }
    
    override var buttonTitle: String {
        return NSLocalizedString("see", comment: "")
    }
    
    override func buttonAction() {
        AppDelegate.seeShared()?.buildRoot()
        QCAppEnvironment.shared().routing?.route(to: SeeExperiencePreviewRoutingEntry(experience: SeeExperience(name: "test", location: "test", imageName: "cineFR", author: "test")))
    }

}
