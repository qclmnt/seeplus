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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        for button in [self.nextButton] {
                        
                        guard let button = button,
                            let sublayers = button.layer.sublayers else {
                                continue
                        }
                        
                        button.layer.cornerRadius = button.frame.height/2
                        
                        for layer in sublayers {
                            layer.frame = CGRect(x: 0,
                                                 y: 0,
                                                 width: button.frame.width,
                                                 height: button.frame.height)
                        }
        }
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Title
        self.titleLabel.text = "Welcome Edgarlee!"
        
        // Info
        self.infoLabel.text = "You’re part\nof SEE+ community!"
        
        // Next Button
        self.nextButton.setTitle("let's go!", for: .normal)
        self.nextButton.configureWithStyle1()
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeStartRoutingEntry())
    }
    

}
