//
//  SeeCongratsRoutingEntry.swift
//  See plus
//
//  Created by Quentin CLEMENT on 15/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeCongratsRoutingEntry: QCRoutingEntry {
    
    override var viewController: UIViewController? {
        return SeeWelcomeViewController(viewModel: SeeCongratsViewControllerViewModel())
    }

}
