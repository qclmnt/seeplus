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
    @IBOutlet weak var likeImageView: UIImageView!
    
    let experience: SeeExperience
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init(nibName: String(describing: SeeExperiencePreviewViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.view.layer.cornerRadius = self.view.frame.height/2
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    func configureLayout() {
        
        self.view.layer.masksToBounds = true
        self.view.layer.borderColor = UIColor.appRed().cgColor
        self.view.layer.borderWidth = 1
        
        self.noteImageView.image = self.noteImageView.image!.withRenderingMode(.alwaysTemplate)
        self.noteImageView.tintColor = UIColor.appRed()
        
        self.experienceImageView.image = self.experience.image
        self.experienceLabel.text = self.experience.name
        self.experienceLocationLabel.text = self.experience.location
    }
    
    @objc func doubleTapped() {
        self.likeImageView.image = UIImage(named: "likeSelected")
        self.likeImageView.squeezeAndBounce()
    }

}
