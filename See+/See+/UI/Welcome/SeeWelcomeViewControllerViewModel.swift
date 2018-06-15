//
//  SeeWelcomeViewControllerViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 15/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SeeWelcomeViewControllerViewModel: QCViewControllerViewModel {
    
    var title:String {
        return String(format:NSLocalizedString("welcome", comment: ""), Defaults[.connectedUser]!)
    }
    
    var info: String {
        return NSLocalizedString("part.of", comment: "")
    }
    
    var buttonTitle: String {
        return NSLocalizedString("let.go", comment: "")
    }
    
    func buttonAction() {
        QCAppEnvironment.shared().routing?.route(to: SeeStartRoutingEntry())
    }

}
