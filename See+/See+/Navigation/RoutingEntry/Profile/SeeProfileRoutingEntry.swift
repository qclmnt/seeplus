//
//  SeeProfileRoutingEntry.swift
//  See plus
//
//  Created by Quentin CLEMENT on 17/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileRoutingEntry: QCRoutingEntry {
    
    let user: SeeUser
    
    // MARK: - Initialization
    
    init(user: SeeUser) {
        self.user = user
        super.init()
    }
    
    override var viewController: UIViewController? {
        return SeeProfileViewController(username: self.user.username)
    }

}
