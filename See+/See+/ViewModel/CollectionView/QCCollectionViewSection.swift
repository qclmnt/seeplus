//
//  QCCollectionViewSection.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class QCCollectionViewSection: NSObject {
    
    lazy var items = [QCCollectionCellViewModel]()

    var edgeInsets: UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    var numberOfColumns: Int {
        return 1 // Default value
    }
    
    var minimumLineSpacing: CGFloat {
        return 0 // Default value
    }
    
    var minimumInteritemSpacing: CGFloat {
        return 0 // Default value
    }
    
    // MARK: - Setup
    
    func setup() {
        // Override in subclass to create items, header and footer
    }
    
}
