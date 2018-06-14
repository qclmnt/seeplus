//
//  SeeExperienceCreateShowViewController.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateShowViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLayout()
    }
    
    func configureLayout() {
       
        self.titleLabel.text = NSLocalizedString("show", comment: "")
        self.uploadButton.setTitle(NSLocalizedString("upload.photos", comment: ""), for: .normal)
        self.nextButton.setTitle(NSLocalizedString("next", comment: ""), for: .normal)
        self.backButton.setTitle(NSLocalizedString("back", comment: ""), for: .normal)
        
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeExperienceDetailRoutingEntry(experience: SeeExperience(name: "test", location: "test", imageName: "", author: "test")))
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeePopRoutingEntry())
    }
    
}
