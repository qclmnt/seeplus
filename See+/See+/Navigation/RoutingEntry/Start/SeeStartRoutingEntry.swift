//
//  SeeStartRoutingEntry.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeStartRoutingEntry: QCRoutingEntry {
    
    // MARK: - QCRoutingEntry
    
    override var viewController: UIViewController? {
        return SeeStartViewController()
    }

}
