//
//  SeeExperiencePreviewViewController.swift
//  See plus
//
//  Created by Quentin CLEMENT on 16/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperiencePreviewViewController: UIViewController {
    
    @IBOutlet weak var experienceImageView: UIImageView!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var noteImageView: UIImageView!
    @IBOutlet weak var experienceLocationLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.view.layer.cornerRadius = self.view.frame.height/2
    }
    
    func configureLayout() {
        
        self.view.layer.masksToBounds = true
        self.view.layer.borderColor = UIColor.appRed().cgColor
        self.view.layer.borderWidth = 1
        
        self.infoView.layer.borderColor = UIColor.appRed().cgColor
        self.infoView.layer.borderWidth = 1
        
        self.experienceImageView.image = UIImage(named: "cineFR")
        self.experienceLabel.text = "Apartment and Workshop\nof Le Corbusier"
        self.experienceLocationLabel.text = "75016 Paris"
    }

}
