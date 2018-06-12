//
//  SeeExperience.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperience: NSObject {
    
    let name: String
    let location: String
    let imageName: String
    let author: String
    var desc: String {
        return """
        Concealed by the façades of the surrounding buildings, this 21-meter high tower is the last vestige of the palace of the dukes of Bougogne, built in 1409 and 1411, whose heir, Jean sans Peur, enlisted in 1407 the throne of
        his cousin the king of France.
        """
    }
    
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
    
    // MARK: - Initialization
    
    init(name: String,
         location: String,
         imageName: String,
         author: String) {
        self.name = name
        self.location = location
        self.imageName = imageName
        self.author = author
        
        super.init()
    }

}
