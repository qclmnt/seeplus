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
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Background
        self.gradientLayer = self.view.addGradientLayer(bottomColor: UIColor.appPurple(),
                                                        topColor: UIColor.appRed())
        
        // Title
        self.titleLabel.text = "Add a profile picture !"
        
        // Profile pic
        
        // Buttons
        self.uploadPhotoButton.setTitle("Upload a photo", for: .normal)
        self.validateButton.setTitle("enter", for: .normal)
    }

}
