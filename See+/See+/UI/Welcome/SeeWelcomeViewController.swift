//
//  SeeWelcomeViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeWelcomeViewController: UIViewController {
    
    // MARK: - View
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureLayout()
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Title
        self.titleLabel.text = "Welcome Bob99"
        
        // Info
        self.infoLabel.text = "You're part of SEE+ community ! Enjoy !"
        
        // Next Button
        self.nextButton.setTitle("let's go !", for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeStartRoutingEntry())
    }
    

}
