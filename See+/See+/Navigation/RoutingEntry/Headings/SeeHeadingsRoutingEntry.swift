
//
//  SeeHeadingsRoutingEntry.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeHeadingsRoutingEntry: QCRoutingEntry {
    
    // MARK: - QCRoutingEntry
    
    override var navigationStyle: QCNavigationStyle {
        return .modal
    }
    
    override var viewController: UIViewController? {
        return SeeHeadingsViewController()
    }

}
