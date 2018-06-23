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
                                                              message: SeeMode.activatedMode() == .propose ? "See you soon !" : "Hi, nice to meet you!"),
                      SeeMessagingCollectionViewCellViewModel(user: SeeUser(username: "Rachelb"),
                                                              message: SeeMode.activatedMode() == .propose ? "Hope you're doing well !?" : "Yes, see you tomorrow !"),
                      SeeMessagingCollectionViewCellViewModel(user: SeeUser(username: "Khalid75"),
                                                              message: SeeMode.activatedMode() == .propose ? "I love New York :)" : "what’s up ?"),
                      SeeMessagingCollectionViewCellViewModel(user: SeeUser(username: "Benoit"),
                                                              message: SeeMode.activatedMode() == .propose ? "I will arrive in Paris tomorrow." : "Do you know the suburb?")]
    }

}
