//
//  SeeDeleteExperiencePresentationController.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeDeleteExperiencePresentationController: UIPresentationController {

    var pinkBackgroundView: UIView
    
    let edgeInsetSide = CGFloat(8)
    
    // MARK: - Initialization
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        self.pinkBackgroundView = UIView()
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        self.setuppinkBackgroundView()
    }
    
    // MARK: - UIPresentationController
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let sideWitdh = CGFloat(DeviceHelper.isIpad() ? 100 : 30)
        let height = CGFloat(DeviceHelper.isIpad() ? 260 : 153)
        return CGRect(x: DeviceHelper.isIpad() ? ((UIScreen.main.bounds.width - 598)/2) : 23,
                      y: DeviceHelper.isIpad() ? (UIScreen.main.bounds.height - sideWitdh - height) : (UIScreen.main.bounds.height - 60 - height),
                      width: CGFloat(DeviceHelper.isIpad() ? 598 : 329),
                      height: height)
    }
    
    // MARK: - Transition
    
    override func presentationTransitionWillBegin() {
        
        DispatchQueue.main.async {
            self.containerView?.insertSubview(self.pinkBackgroundView, at: 0)
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pinkBackgroundView]|", options: [], metrics: nil, views: ["pinkBackgroundView": self.pinkBackgroundView]))
            NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pinkBackgroundView]|", options: [], metrics: nil, views: ["pinkBackgroundView": self.pinkBackgroundView]))
            
            guard let coordinator = self.presentedViewController.transitionCoordinator else {
                self.pinkBackgroundView.alpha = 1.0
                return
            }
            
            coordinator.animate(alongsideTransition: { _ in
                self.pinkBackgroundView.alpha = 1.0
            })
        }
        
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            self.pinkBackgroundView.alpha = 0.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.pinkBackgroundView.alpha = 0.0
        })
    }
    
    // MARK: - Black background view
    
    func setuppinkBackgroundView() {
        self.pinkBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.pinkBackgroundView.backgroundColor = UIColor.appPinkBackground()
        self.pinkBackgroundView.alpha = 1.0
        
        self.pinkBackgroundView.createTapGesture(target: self, selector: #selector(pinkBackgroundTapped(recognizer:)))
    }
    
    @objc func pinkBackgroundTapped(recognizer: UITapGestureRecognizer) {
        QCAppEnvironment.shared().routing?.route(to: SeeDismissRoutingEntry())
    }
}
