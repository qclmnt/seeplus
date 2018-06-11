//
//  SeeAboutRoutingEntry.swift
//  See plus
//
//  Created by Quentin CLEMENT on 11/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeAboutRoutingEntry: QCRoutingEntry {
    
    // MARK: - QCRoutingEntry
    
    override var navigationStyle: QCNavigationStyle {
        return .modal
    }
    
    override var viewController: UIViewController? {
        return SeeNavigationController(rootViewController: SeeAboutViewController(), showToolbar: false) 
    }

}
