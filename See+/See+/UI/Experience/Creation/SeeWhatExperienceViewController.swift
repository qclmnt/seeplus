//
//  SeeWhatExperienceViewController.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeWhatExperienceViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nameTextFlield: SeeTextField!
    @IBOutlet weak var descTextField: SeeTextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.nextButton.layer.cornerRadius = self.nextButton.frame.height/2
        self.backButton.layer.cornerRadius = self.backButton.frame.height/2
        self.descTextField.layer.cornerRadius = self.descTextField.frame.height/2
        self.nameTextFlield.layer.cornerRadius = self.nameTextFlield.frame.height/2
        
        if let sublayers = self.nextButton.layer.sublayers {
            for layer in sublayers {
                layer.frame = self.nextButton.bounds
            }
        }
    }
    
    // MARK: - Configure layout
    
    func configureLayout() {
        
        self.titleLabel.text = NSLocalizedString("what.experience", comment: "")
        self.nameLabel.text = NSLocalizedString("name.experience", comment: "")
        self.descLabel.text = NSLocalizedString("desc.experience", comment: "")
        
        self.descTextField.configureWithStyle1(color: .appRed(), border: 2)
        self.nameTextFlield.configureWithStyle1(color: .appRed(), border: 2)
        
        self.nextButton.setTitle(NSLocalizedString("next", comment: ""), for: .normal)
        self.nextButton.configureWithStyle1()
        self.backButton.setTitle(NSLocalizedString("back", comment: ""), for: .normal)
        self.backButton.configureWithStyle1(color: .appRed(), border: 2)
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeWhereExperienceRoutingEntry())
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeePopRoutingEntry())
    }
    

}
