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
        self.liveButton.setTitle("Propose an experience", for: .normal)
    }

}
