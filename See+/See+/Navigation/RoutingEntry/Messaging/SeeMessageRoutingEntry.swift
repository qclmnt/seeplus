//
//  SeeMessageRoutingEntry.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessageRoutingEntry: QCRoutingEntry {
    
    let user: SeeUser
    
    // MARK: - Initialization
    
    init(user: SeeUser) {
        self.user = user
        super.init()
    }
    
    // MARK: - QCRoutingEntry
    
    override var viewController: UIViewController? {
        return SeeMessageViewController(user: self.user)
    }

}
