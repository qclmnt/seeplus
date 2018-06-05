//
//  QCAppEnvironment.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import Foundation

class QCAppEnvironment: NSObject {

    private static let instance = QCAppEnvironment()
    class func shared() -> QCAppEnvironment {
        return instance
    }
    
    var routing: QCNavigator?
}

extension QCAppEnvironment {
    
    func configureAppEnvironment() {
        self.routing = QCRouting()
    }
}
