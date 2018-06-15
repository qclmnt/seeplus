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
        let _ = self.uploadButton.addHorizontalGradientLayer(leftColor: .appRed(), rightColor: .appPurple())
        self.nextButton.setTitle(NSLocalizedString("next", comment: ""), for: .normal)
        let _ = self.nextButton.addHorizontalGradientLayer(leftColor: .appRed(), rightColor: .appPurple())
        
        self.backButton.setTitle(NSLocalizedString("back", comment: ""), for: .normal)
        self.backButton.layer.borderColor = UIColor.appRed().cgColor
        self.backButton.layer.borderWidth = 2
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let buttons = [self.uploadButton, self.nextButton, self.backButton]
        if let buttons = buttons as? [UIButton] {
            for button in buttons {
                button.layer.cornerRadius = button.bounds.height/2
                if let layers = button.layer.sublayers {
                    for layer in layers {
                        layer.frame = button.bounds
                    }
                }
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeExperienceDetailRoutingEntry(viewModel: SeeExperienceCreateDetailCollectionViewModel(experience: SeeExperience(name: "test", location: "test", imageName: "", author: "test"))))
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeePopRoutingEntry())
    }
    
}
