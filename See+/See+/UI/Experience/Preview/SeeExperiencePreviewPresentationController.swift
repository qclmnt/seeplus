//
//  SeeExperiencePreviewPresentationController.swift
//  See plus
//
//  Created by Quentin CLEMENT on 16/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperiencePreviewPresentationController: UIPresentationController {

    var clearBackgroundView: UIView
    
    let edgeInsetSide = CGFloat(8)
    
    // MARK: - Initialization
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        self.clearBackgroundView = UIView()
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        self.setupclearBackgroundView()
    }
    
    // MARK: - UIPresentationController
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let witdh = CGFloat(DeviceHelper.isIpad() ? 289.87 : 300)
        let height = CGFloat(DeviceHelper.isIpad() ? 289.87 : 300)
        return CGRect(x: 100,
                      y: 100,
                      width: witdh,
                      height: height)
    }
    
    // MARK: - Transition
    
    override func presentationTransitionWillBegin() {
        
        DispatchQueue.main.async {
            self.containerView?.insertSubview(self.clearBackgroundView, at: 0)
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[clearBackgroundView]|", options: [], metrics: nil, views: ["clearBackgroundView": self.clearBackgroundView]))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[clearBackgroundView]|", options: [], metrics: nil, views: ["clearBackgroundView": self.clearBackgroundView]))
            
            guard let coordinator = self.presentedViewController.transitionCoordinator else {
                self.clearBackgroundView.alpha = 1.0
                return
            }
            
            coordinator.animate(alongsideTransition: { _ in
                self.clearBackgroundView.alpha = 1.0
            })
        }
        
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            self.clearBackgroundView.alpha = 0.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.clearBackgroundView.alpha = 0.0
        })
    }
    
    // MARK: - Black background view
    
    func setupclearBackgroundView() {
        self.clearBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.clearBackgroundView.backgroundColor = UIColor.clear
        self.clearBackgroundView.alpha = 1.0
        
        self.clearBackgroundView.createTapGesture(target: self, selector: #selector(pinkBackgroundTapped(recognizer:)))
    }
    
    @objc func pinkBackgroundTapped(recognizer: UITapGestureRecognizer) {
        QCAppEnvironment.shared().routing?.route(to: SeeDismissRoutingEntry())
    }
}
