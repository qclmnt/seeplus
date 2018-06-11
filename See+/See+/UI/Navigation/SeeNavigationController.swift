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
        self.navigationBar.configureWithStyle1(color: .appRed())
    }
    
    // MARK: - Actions
    
    @objc func aboutButtonTouchUpInside() {
        QCAppEnvironment.shared().routing?.route(to: SeeAboutRoutingEntry())
    }

}

extension SeeNavigationController : UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.leftBarButtonItem = self.leftBarButtonItem
        
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
    
}
