//
//  SeeManageRoutingEntry.swift
//  See plus
//
//  Created by Quentin CLEMENT on 17/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeManageRoutingEntry: QCRoutingEntry {
    
    override var viewController: UIViewController? {
        return SeeCreateExperienceManagePhotoViewController()
    }

}
