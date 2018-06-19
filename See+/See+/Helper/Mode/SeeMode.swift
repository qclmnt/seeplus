//
//  SeeMode.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SeeMode: NSObject {
    
    class func activatedMode() -> UserMode {
        if Defaults[.connectedUserMode] == 0 {
            return .discover
        } else {
            return .propose
        }
    }
    
    class func colorForActivatedMode(mode: UserMode = UserMode(rawValue: Defaults[.connectedUserMode])!) -> UIColor {
        if mode == .discover {
            return .appPurple() // discover
        } else {
            return .appRed() // propose
        }
    }

}
