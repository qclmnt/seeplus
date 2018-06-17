//
//  SeeSignUpTourViewController.swift
//  See plus
//
//  Created by Quentin CLEMENT on 17/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SeeSignUpTourViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var layer: CALayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.startButton.layer.cornerRadius = self.startButton.frame.height/2
        self.layer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func configureLayout() {
        
        self.layer = self.view.addGradientLayer(bottomColor: .appRed(), topColor: .appPurple())
        
        self.titleLabel.text = NSLocalizedString("start.message", comment: "")
        self.startButton.setTitle(NSLocalizedString("start", comment: ""), for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func startButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeSignupRoutinEntry())
        Defaults[.hasSeenSignUpTour] = true
    }
    

}
