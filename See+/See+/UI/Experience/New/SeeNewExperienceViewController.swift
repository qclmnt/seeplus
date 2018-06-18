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
    
    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var mapScrollView: UIScrollView!
    
    var grayView: UIView?
    
    lazy var experiences = [SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.596, 0.465)), // Gare de l’est √
                            SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.393, 0.583)), // Michel Ange √
                            SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.535, 0.575)), // Denfer Rochereau √
                            SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.627, 0.608)), // Biblio Francois Mit √
                            SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.617, 0.42)), // Riquet √
                            SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.662, 0.42)), // Porte de Pantin √
                            SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.66, 0.66)), // Vitry centre √
                            SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.32, 0.617)), // Saint clou √
                            SeeExperience(name: "name", location: "location", imageName: "cineFR", author: "Bob", mapPositionRatio: (0.375, 0.66))] // Pont de sèvre √
    
    var experiencesVisible = false
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let centerX = (self.mapScrollView.contentSize.width/2) - (self.mapScrollView.bounds.size.width/2)
        let centerY = (self.mapScrollView.contentSize.height/2) - (self.mapScrollView.bounds.size.height/2)
        self.mapScrollView.contentOffset = CGPoint(x: centerX, y: centerY)
        
        // Add Experience
        if self.experiencesVisible == false {
            self.addExperiences()
            self.updatePositionView()
        }
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
        let mapContentSize = CGSize(width: deviceSize.width, height: deviceSize.height)
        self.mapScrollView.contentSize = mapContentSize
        self.mapImageView.image = UIImage(named: "map")
        self.mapScrollView.maximumZoomScale = CGFloat(DeviceHelper.isIpad() ? 3.0 : 6.0)
        self.mapScrollView.delegate = self
        self.mapScrollView.zoomScale = DeviceHelper.isIpad() ? 1.5 : 3.0
        let centerX = (self.mapScrollView.contentSize.width/2) - (self.mapScrollView.bounds.size.width/2)
        let centerY = (self.mapScrollView.contentSize.height/2) - (self.mapScrollView.bounds.size.height/2)
        self.mapScrollView.contentOffset = CGPoint(x: centerX, y: centerY)
        
    }
    
    // MARK: - Experiences
    
    func addExperiences() {
        for (idx,exp) in self.experiences.enumerated() {
            let dispatchTime = (1 + 0.3*Double(idx))
            DispatchQueue.main.asyncAfter(deadline: .now() + dispatchTime) {
                self.mapScrollView.addSubview(exp.imageView)
                exp.imageView.squeezeAndBounce()
            }
        }
    }
    
    // MARK: - Update position
    
    func updatePositionView() {
        for exp in self.experiences {
            exp.setImageViewFrame(width: self.mapScrollView.contentSize.width, height: self.mapScrollView.contentSize.height, zoom: self.mapScrollView.zoomScale)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func newButtonTouchUpInside(_ sender: UIButton) {
        guard let newExperienceViewModel = self.viewModel as? SeeNewExperienceViewControllerViewModel else {return}
        newExperienceViewModel.showHeadings()
    }
    


}

extension SeeNewExperienceViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.mapImageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.updatePositionView()
    }
    
}
