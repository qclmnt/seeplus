//
//  SeeUser.swift
//  See plus
//
//  Created by Quentin CLEMENT on 13/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

enum UserMode {
    case discover
    case propose
}

class SeeUser: NSObject {
    
    let username: String
    let userMode: UserMode
    
    // MARK: - Initialization
    
    init(username: String,
         userMode: UserMode) {
        self.username = username
        self.userMode = userMode
        super.init()
    }
}
