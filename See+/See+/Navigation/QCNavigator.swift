//
//  QCNavigator.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import Foundation
import UIKit

// Do not delete this class, it is used by YMMRouting for iOS App
protocol QCNavigator {
    var lastRoutingEntry: QCRoutingEntry? { get set }
    func visibleViewController() -> UIViewController?
    func visibleViewController(_ rootViewController: UIViewController?) -> UIViewController?
    func route(to entry: QCRoutingEntry)
    func route(to entry: QCRoutingEntry, from fromViewController: UIViewController?)
}
