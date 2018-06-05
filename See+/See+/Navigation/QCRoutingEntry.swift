//
//  QCRoutingEntry.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class QCRoutingEntry: NSObject {
    
    // MARK: - Properties
    
    var viewController: UIViewController? {
        return nil
    }
    
    var navigationStyle: QCNavigationStyle {
        return .push
    }
    
    var animated: Bool {
        return true
    }
    
    var url: String? {
        return nil
    }
    
    var completionBlock: (() -> Void)?
    
    // MARK: - Custom transition
    
    func performCustomTransition() {
        // Overrides in subclasses with custom navigationStyle
    }
    
}
