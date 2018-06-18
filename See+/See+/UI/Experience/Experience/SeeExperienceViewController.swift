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
    @IBOutlet weak var experienceImageView: UIImageView!
    
    let viewModel: SeeExperienceViewControllerViewModel
    
    // MARK: - Initialization
    
    init(viewModel: SeeExperienceViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: SeeExperienceViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.usernameLabel.text = self.viewModel.experience.author
        self.experienceNameLabel.text = self.viewModel.experience.name
        self.experienceImageView.image = self.viewModel.experience.image
        self.experienceLocationLabel.text = self.viewModel.experience.location
        
        self.experienceView.layer.masksToBounds = true
        self.experienceView.layer.cornerRadius = DeviceHelper.isIpad() ? 80 : 47
    }
    
    // MARK: - Action
    
    @IBAction func moreButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeExperienceDetailRoutingEntry(viewModel: SeeExperienceDetailViewControllerCollectionViewModel(experience: self.viewModel.experience)))
    }
    

}
