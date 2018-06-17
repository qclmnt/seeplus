//
//  DefaultsKeys+See.swift
//  See plus
//
//  Created by Quentin CLEMENT on 13/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    
    static let usersBase = DefaultsKey<[String]?>("usersBase") // String of usernames
    static let connectedUser = DefaultsKey<String?>("connectedUser") // Only username
    static let connectedUserMode = DefaultsKey<Int>("connectedUserMode") // 0 discover 1 propose
    static let languageSelected = DefaultsKey<String?>("languageSelected") // fr or en
    static let hasSeenSignUpTour = DefaultsKey<Bool?>("hasSeenSignUpTour")

}
