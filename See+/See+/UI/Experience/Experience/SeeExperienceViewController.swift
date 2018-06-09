//
//  SeeExperienceViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var experienceView: UIView!
    @IBOutlet weak var experienceNameLabel: UILabel!
    @IBOutlet weak var experienceLocationLabel: UILabel!
    @IBOutlet weak var markDotImageView: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action
    
    @IBAction func moreButtonTouchUpInside(_ sender: UIButton) {
        
    }
    

}
