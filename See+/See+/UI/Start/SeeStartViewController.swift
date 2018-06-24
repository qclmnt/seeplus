//
//  SeeStartViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SeeStartViewController: UIViewController {

    // MARK: - View

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var liveButton: UIButton!
    @IBOutlet weak var proposeButton: UIButton!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        for button in [self.liveButton,
                          self.proposeButton] {
                            
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

        // Info
        self.infoLabel.text = NSLocalizedString("start.title", comment: "")
        
        // Buttons
        self.liveButton.setTitle(NSLocalizedString("to.discover", comment: ""), for: .normal)
        self.proposeButton.setTitle(NSLocalizedString("to.propose", comment: ""), for: .normal)
        for button in [self.liveButton,
                       self.proposeButton] {
                        button?.configureWithStyle1()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func liveButtonTouchUpInside(_ sender: UIButton) {
        Defaults[.connectedUserMode] = 0
        AppDelegate.shared()?.window??.rootViewController = SeeTabBarController(viewModel: SeeTabBarTravellerControllerViewModel())
    }
    
    @IBAction func proposeButtonTouchUpInside(_ sender: UIButton) {
        Defaults[.connectedUserMode] = 1
        AppDelegate.shared()?.window??.rootViewController = SeeTabBarController(viewModel: SeeTabBarResidentControllerViewModel())
    }
    
}
