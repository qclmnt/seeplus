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
        return UIImage(named: self.imageName)
    }
    
    lazy var imageView: UIImageView = {
        let markerImage = UIImage(named: "mapPoint")
        let imageView = UIImageView(image: markerImage)
        imageView.contentMode = .scaleAspectFit
        imageView.createTapGesture(target: self, selector: #selector(self.experienceViewTapped))
        return imageView
    }()
    
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
        self.imageView.frame = CGRect(x: (width * self.mapPositionRatio.x)-19*zoom, y: (height * self.mapPositionRatio.y)-26*zoom, width: 19*zoom, height: 26*zoom)
    }
    
    @objc func experienceViewTapped() {
        QCAppEnvironment.shared().routing?.route(to: SeeExperiencePreviewRoutingEntry())
    }

}
