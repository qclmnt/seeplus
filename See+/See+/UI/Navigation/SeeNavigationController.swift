//
//  SeeNavigationController.swift
//  See+
//
//  Created by Quentin CLEMENT on 10/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeNavigationController: UINavigationController {
    
    lazy var leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logo-navbar"),
                                                 style: .plain,
                                                 target: nil,
                                                 action: nil)
    
    lazy var proposeBarButtonItem = UIBarButtonItem(title: "PROPOSE", style: .plain, target: nil, action: nil)
    lazy var discoverBarButtonItem = UIBarButtonItem(title: "DISCOVER", style: .plain, target: nil, action: nil)
    lazy var languageBarButtonItem = UIBarButtonItem(title: "FR/EN", style: .plain, target: nil, action: nil)
    
    var showToolbar = false
    
    // MARK: - Initialization
    
    init(rootViewController: UIViewController,
         showToolbar: Bool) {
        super.init(rootViewController: rootViewController)
        self.delegate = self
        self.showToolbar = showToolbar
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: String(describing: UINavigationController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    
    @objc func aboutButtonTouchUpInside() {
        QCAppEnvironment.shared().routing?.route(to: SeeAboutRoutingEntry())
    }

}

extension SeeNavigationController : UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        // Nav bar
        
        // Left
        viewController.navigationItem.leftBarButtonItem = self.leftBarButtonItem
        
        
        // Right
        var rightBarButtonItems = [UIBarButtonItem]()
        rightBarButtonItems.append(self.languageBarButtonItem)
        if (navigationController.tabBarController != nil) {
            rightBarButtonItems.append(contentsOf: [self.discoverBarButtonItem,
                                                    self.proposeBarButtonItem])
        }
        viewController.navigationItem.rightBarButtonItems = rightBarButtonItems
        
        // Tool bar
        if (self.showToolbar == true) {
            navigationController.setToolbarHidden(false, animated: false)
            navigationController.toolbar.isTranslucent = false
            let flexItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let aboutImage = UIImage(named: "about-button")
            let aboutButtonItem = UIBarButtonItem(image: aboutImage,
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(self.aboutButtonTouchUpInside))
            viewController.toolbarItems = [flexItem, aboutButtonItem]
        }
    }
    
    // Not clean: to do other way
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if (fromVC is SeeExperienceViewController && toVC is SeeExperienceDetailViewController) ||
            (toVC is SeeExperienceViewController && fromVC is SeeExperienceDetailViewController) {
            if operation == .push {
                return FadeAnimationController(presenting: true)
            } else {
                return FadeAnimationController(presenting: false)
            }
        }
        
        return nil
        
        
    }
    
}
