//
//  SeeNewExperienceViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

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
    
    // Cinema
    
    lazy var experiences: [SeeExperience] = [SeeExperience]()
        
        
    @objc func reloadExp() {
        var experiences = [SeeExperience]()
        guard let headingsSelected = Defaults[.selectedHeadings] else {return}
        for rubric in headingsSelected {
            let exp = SeeMode.experiences(rubric: SeeRubric(rawValue: rubric)!)
            experiences.append(contentsOf: exp)
        }
        self.experiences = experiences
        
        self.resetMap()
        self.addExperiences()
        self.updatePositionView()
    }
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadExp), name: Notification.Name("reloadExp"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let centerX = (self.mapScrollView.contentSize.width/2) - (self.mapScrollView.bounds.size.width/2)
        let centerY = (self.mapScrollView.contentSize.height/2) - (self.mapScrollView.bounds.size.height/2)
        self.mapScrollView.contentOffset = CGPoint(x: centerX, y: centerY)
        
        // Add Experience
        if self.experiencesVisible == false {
            self.reloadExp()
            
//            self.addLines()
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
        
        self.resetMap()
    }
    
    func resetMap() {
        
        // Subviews
        for view in self.mapScrollView.subviews {
            if (view != self.mapImageView) {
                view.removeFromSuperview()
            }
        }
        
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
            let dispatchTime = (1 + 0.1*Double(idx))
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
    

    // MARK: - Helper
    
    func addLines() {
        for i in [0.0, 0.1, 0.20, 0.30, 0.40, 0.50, 0.60, 0.7, 0.8, 0.9, 1.0] {
            self.view.layer.addSublayer(self.createVerticalLine(xRatio: CGFloat(i), color: .black))
            self.view.layer.addSublayer(self.createHorizontalLine(yRatio: CGFloat(i), color: .black))
        }
        
        for i in [0.05, 0.15, 0.25, 0.35, 0.45, 0.55, 0.65, 0.75, 0.5, 0.5] {
            self.view.layer.addSublayer(self.createVerticalLine(xRatio: CGFloat(i), color: .green))
            self.view.layer.addSublayer(self.createHorizontalLine(yRatio: CGFloat(i), color: .green))
        }
    }
    
    func createVerticalLine(xRatio: CGFloat, color: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = CGRect(x: self.mapScrollView.contentSize.width*xRatio, y: 0, width: 1, height: self.view.frame.height)
        layer.backgroundColor = color.cgColor
        return layer
    }
    
    func createHorizontalLine(yRatio: CGFloat, color: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: self.mapScrollView.contentSize.height*yRatio, width: self.view.frame.width, height: 1)
        layer.backgroundColor = color.cgColor
        return layer
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
