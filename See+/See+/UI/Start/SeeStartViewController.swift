//
//  SeeStartViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

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
    
    // MARK: - Configure
    
    func configureLayout() {

        // Info
        self.infoLabel.text = "Live or propose an experience in a big city !"
        
        // Buttons
        self.liveButton.setTitle("Live an experience", for: .normal)
        self.proposeButton.setTitle("Propose an experience", for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func liveButtonTouchUpInside(_ sender: UIButton) {
        AppDelegate.shared()?.window??.rootViewController = SeeTabBarController(viewModel: SeeTabBarTravellerControllerViewModel())
    }
    
    @IBAction func proposeButtonTouchUpInside(_ sender: UIButton) {
        AppDelegate.shared()?.window??.rootViewController = SeeTabBarController(viewModel: SeeTabBarResidentControllerViewModel())
    }
    
}
