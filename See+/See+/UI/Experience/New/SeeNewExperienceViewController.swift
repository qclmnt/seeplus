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
        let mapContentSize = CGSize(width: deviceSize.width, height: deviceSize.height)
        self.mapScrollView.contentSize = mapContentSize
        self.mapImageView.image = UIImage(named: "map")
        self.mapScrollView.maximumZoomScale = CGFloat(3.0)
        self.mapScrollView.delegate = self
        self.mapScrollView.zoomScale = 1.5
        //TODO CENTER
        
        // Add Experience
        self.grayView = UIView(frame: CGRect(x: 300, y: 200, width: 20, height: 20))
        self.grayView?.backgroundColor = .gray
        self.mapScrollView.addSubview(self.grayView!)
        self.grayView?.createTapGesture(target: self, selector: #selector(self.experienceViewTapped))
        
    }
    
    // MARK: - Update position
    
    func updatePositionView() {
        let zoom = self.mapScrollView.zoomScale
        self.grayView?.frame = CGRect(x: 300*zoom, y: 200*zoom, width: 20*zoom, height: 20*zoom)
    }
    
    // MARK: - Actions
    
    @IBAction func newButtonTouchUpInside(_ sender: UIButton) {
        guard let newExperienceViewModel = self.viewModel as? SeeNewExperienceViewControllerViewModel else {return}
        newExperienceViewModel.showHeadings()
    }
    
    @objc func experienceViewTapped() {
        QCAppEnvironment.shared().routing?.route(to: SeeExperiencePreviewRoutingEntry())
//        QCAppEnvironment.shared().routing?.route(to: SeeExperienceRoutingEntry(experience: SeeExperience(name: "test", location: "test", imageName: "", author: "test")))
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
