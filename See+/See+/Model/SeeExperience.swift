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
    let mapPositionRatio: (x: CGFloat, y: CGFloat)
    
    var image: UIImage? {
        let imageName = "\(self.imageName)1"
        return UIImage(named: imageName)
    }
    
    lazy var imageView: UIImageView = {
        let markerImage = UIImage(named: "mapPoint")
        let imageView = UIImageView(image: markerImage)
        imageView.contentMode = .scaleAspectFit
        imageView.createTapGesture(target: self, selector: #selector(self.experienceViewTapped))
        return imageView
    }()
    
    var image2: UIImage? {
        let imageName = "\(self.imageName)2"
        return UIImage(named: imageName)
    }
    
    var image3: UIImage? {
        let imageName = "\(self.imageName)3"
        return UIImage(named: imageName)
    }
    
    lazy var user: SeeUser = SeeUser(username: "Benoit")
    
    // MARK: - Initialization
    
    init(name: String,
         location: String,
         imageName: String,
         author: String,
         mapPositionRatio: (x: CGFloat, y: CGFloat) = (0,0)) {
        self.name = name
        self.location = location
        self.imageName = imageName
        self.author = author
        self.mapPositionRatio = mapPositionRatio
        
        super.init()
    }
    
    func setImageViewFrame(width: CGFloat, height: CGFloat, zoom: CGFloat) {
        let heightMarker = CGFloat(DeviceHelper.isIpad() ? 26.0 : 13.0)
        let widthMarker = CGFloat(DeviceHelper.isIpad() ? 19.0 : 9.0)
        self.imageView.frame = CGRect(x: (width * self.mapPositionRatio.x)-(widthMarker*zoom), y: (height * self.mapPositionRatio.y)-(heightMarker*zoom), width: (widthMarker*zoom), height: (heightMarker*zoom))
    }
    
    @objc func experienceViewTapped() {
        QCAppEnvironment.shared().routing?.route(to: SeeExperiencePreviewRoutingEntry(experience: self))
    }

}
