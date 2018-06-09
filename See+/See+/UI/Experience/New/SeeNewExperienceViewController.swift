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
    
    @IBOutlet weak var mapScrollView: UIScrollView!
    
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
        
        // Map scroll view
        let deviceSize = UIScreen.main.bounds.size
        let mapContentSize = CGSize(width: deviceSize.width*1.5, height: deviceSize.height*1.1)
        self.mapScrollView.contentSize = mapContentSize
        let image = UIImage(named: "map")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: mapContentSize.width, height: mapContentSize.height)
        self.mapScrollView.addSubview(imageView)
        
        // Add Experience
        let view = UIView(frame: CGRect(x: mapContentSize.width-300, y: 200, width: 100, height: 100))
        view.backgroundColor = .gray
        self.mapScrollView.addSubview(view)
        view.createTapGesture(target: self, selector: #selector(self.experienceViewTapped))
        
    }
    
    // MARK: - Actions
    
    @IBAction func newButtonTouchUpInside(_ sender: UIButton) {
        guard let newExperienceViewModel = self.viewModel as? SeeNewExperienceViewControllerViewModel else {return}
        newExperienceViewModel.showHeadings()
    }
    
    @objc func experienceViewTapped() {
        QCAppEnvironment.shared().routing?.route(to: SeeExperienceRoutingEntry())
    }

}
