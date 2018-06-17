//
//  SeeMessagingCollectionViewSection.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessagingCollectionViewSection: QCCollectionViewSection {
    
    override func setup() {
        self.items = [SeeMessagingCollectionViewCellViewModel(user: SeeUser(username: "Eliott92"),
                                                              message: "See you soon !"),
                      SeeMessagingCollectionViewCellViewModel(user: SeeUser(username: "Rachelb"),
                                                              message: "Hope you're doing well !?"),
                      SeeMessagingCollectionViewCellViewModel(user: SeeUser(username: "Khalid75"),
                                                              message: "I love New York :)"),
                      SeeMessagingCollectionViewCellViewModel(user: SeeUser(username: "Benoit"),
                                                              message: "I will arrive in Paris tomorrow.")]
    }

}
