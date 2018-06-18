//
//  SeeProfilePicViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfilePicViewController: UIViewController {
    
    // MARK: - View
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var uploadPhotoButton: UIButton!
    @IBOutlet weak var validateButton: UIButton!
    
    var gradientLayer: CAGradientLayer?
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.gradientLayer?.frame = self.view.bounds
        self.profilePicImageView.layer.cornerRadius = self.profilePicImageView.frame.width/2
        
        for button in [self.uploadPhotoButton,
                       self.validateButton] {
                        guard let button = button else {return}
                        button.layer.cornerRadius = button.layer.frame.size.height/2
        }
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Background
        self.gradientLayer = self.view.addGradientLayer(bottomColor: UIColor.appRed(),
                                                        topColor: UIColor.appPurple())
        
        // Title
        self.titleLabel.text = NSLocalizedString("add.profile.pic", comment: "")
        
        // Profile pic
        
        // Buttons
        self.uploadPhotoButton.setTitle(NSLocalizedString("upload.photo", comment: ""), for: .normal)
        self.validateButton.setTitle(NSLocalizedString("enter", comment: ""), for: .normal)
        self.uploadPhotoButton.layer.borderWidth = DeviceHelper.isIpad() ? 2 : 1
        self.uploadPhotoButton.layer.borderColor = UIColor.white.cgColor
        self.uploadPhotoButton.layer.masksToBounds = true
    }
    
    // MARK: - Actions

    @IBAction func uploadPhotoTouchUpInside(_ sender: UIButton) {
        self.profilePicImageView.image = UIImage(named: "george")
        self.validateButton.setImage(UIImage(named: "validate"), for: .normal)
        self.validateButton.setTitle("", for: .normal)
    }
    
    @IBAction func validateButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeWelcomeRoutingEntry())
    }
}
