//
//  SeeNewExperienceViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeNewExperienceViewController: SeeTabBarViewController {

    override var viewModel: SeeTabBarViewControllerViewModel {
        return SeeNewExperienceViewControllerViewModel()
    }
    
    // MARK: - Views
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var newExperienceButton: UIButton!
    var gradientLayer: CAGradientLayer?
    
    // MARK: - Initialization
    
    override init() {
        super.init(nibName: String(describing: SeeNewExperienceViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.gradientLayer?.frame = self.bottomView.bounds
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Bottom view
        self.gradientLayer = self.bottomView.addHorizontalGradientLayer(leftColor: UIColor.appRed(),
                                                              rightColor: UIColor.appPurple())
        
    }

}
