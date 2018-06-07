//
//  SeeMessagingCollectionViewSection.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessagingCollectionViewSection: QCCollectionViewSection {
    
    override init() {
        super.init()
        self.setup()
    }
    
    override func setup() {
        self.items = [SeeMessagingCollectionViewCellViewModel(username: "Benoit22",
                                                              message: "See you soon !"),
                      SeeMessagingCollectionViewCellViewModel(username: "Marie4",
                                                              message: "Hope you're doing well !?"),
                      SeeMessagingCollectionViewCellViewModel(username: "AlexNY",
                                                              message: "I love New York :)"),
                      SeeMessagingCollectionViewCellViewModel(username: "JulieN",
                                                              message: "I will arrive at Paris tomorrow."),
                      SeeMessagingCollectionViewCellViewModel(username: "Marine01",
                                                              message: "The best day ever!")]
    }

}
