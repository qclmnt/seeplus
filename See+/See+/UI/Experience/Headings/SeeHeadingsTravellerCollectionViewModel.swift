//
//  SeeHeadingsTravellerCollectionViewModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeHeadingsTravellerCollectionViewModel: SeeHeadingsCollectionViewModel {
    
    // MARK: - SeeHeadingsCollectionViewModel

    override func next() {
        QCAppEnvironment.shared().routing?.route(to: SeeDismissRoutingEntry())
    }
}
