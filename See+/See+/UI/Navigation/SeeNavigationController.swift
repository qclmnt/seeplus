//
//  SeeNavigationController.swift
//  See+
//
//  Created by Quentin CLEMENT on 10/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SeeNavigationController: UINavigationController {
    
    lazy var leftBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "logo-navbar"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(self.logoButtonTouchUpInside))
        return button
    }()
    
    
    
    lazy var proposeBarButtonItem: UIBarButtonItem = {
        let title = NSLocalizedString("propose", comment: "").uppercased()
        let titleFormatString = DeviceHelper.isIpad() ? "%@\t" : "%@   "
        let barButton = UIBarButtonItem(title: String(format: titleFormatString, title), style: .plain, target: self, action: #selector(self.proposeButtonTouchUpInside))
        barButton.tintColor = .appRed()
        let fontName = SeeMode.activatedMode() == .propose ? "Gotham-Medium" : "Gotham-Book"
//        barButton.setTitlePositionAdjustment(UIOffset(horizontal: -60, vertical: 0), for: .default)
        if let font = UIFont(name: fontName, size: DeviceHelper.isIpad() ? 13 : 10) {
            barButton.setTitleTextAttributes([NSAttributedStringKey.font: font], for: .normal)
        }
        return barButton
    }()
    lazy var discoverBarButtonItem: UIBarButtonItem = {
        let title = NSLocalizedString("discover", comment: "").uppercased()
        let titleFormatString = DeviceHelper.isIpad() ? "\t%@\t\t" : "  %@   "
        let barButton = UIBarButtonItem(title: String(format: titleFormatString, title), style: .plain, target: self, action: #selector(self.discoverButtonTouchUpInside))
        barButton.tintColor = .appRed()
//        barButton.setTitlePositionAdjustment(UIOffset(horizontal: -30, vertical: 0), for: .default)
        let fontName = SeeMode.activatedMode() == .discover ? "Gotham-Medium" : "Gotham-Book"
        if let font = UIFont(name: fontName, size: DeviceHelper.isIpad() ? 13 : 10) {
            barButton.setTitleTextAttributes([NSAttributedStringKey.font: font], for: .normal)
        }
        return barButton
    }()
    lazy var languageBarButtonItem: UIBarButtonItem = {
        let title = DeviceHelper.isIpad() ? "FR / EN" : "  FR / EN"
        let barButton = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(self.languageButtonTouchUpInside))
        barButton.tintColor = .appRed()
        if let font = UIFont(name: "Gotham-Book", size: DeviceHelper.isIpad() ? 13 : 10) {
            barButton.setTitleTextAttributes([NSAttributedStringKey.font: font], for: .normal)
        }
        return barButton
    }()
    
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
    
    @objc func logoButtonTouchUpInside() {
//        let signupRoutingEntry = SeeSignupRoutinEntry()
//        let navigationController = SeeNavigationController(rootViewController: signupRoutingEntry.viewController ?? UIViewController(),
//                                                           showToolbar: true)
//
//        AppDelegate.shared()?.window??.rootViewController = navigationController
    }
    
    @objc func aboutButtonTouchUpInside() {
        QCAppEnvironment.shared().routing?.route(to: SeeAboutRoutingEntry())
    }
    
    @objc func proposeButtonTouchUpInside() {
        Defaults[.connectedUserMode] = 1
        AppDelegate.shared()?.window??.rootViewController = SeeTabBarController(viewModel: SeeTabBarResidentControllerViewModel())
    }
    
    @objc func discoverButtonTouchUpInside() {
        Defaults[.connectedUserMode] = 0
        AppDelegate.shared()?.window??.rootViewController = SeeTabBarController(viewModel: SeeTabBarTravellerControllerViewModel())
    }
    
    @objc func languageButtonTouchUpInside() {
        guard let currentLanguage = Defaults[.languageSelected] else {return}
        
        var newLanguage = "fr"
        if currentLanguage == "fr" {
            newLanguage = "en"
        }
        
        Bundle.setLanguage(newLanguage)
        Defaults[.languageSelected] = newLanguage
        AppDelegate.seeShared()?.buildRoot()
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
        if (QCAppEnvironment.shared().routing?.visibleViewController() is SeeConnectionViewController) == false,
            (QCAppEnvironment.shared().routing?.visibleViewController() is SeeSignUpTourViewController) == false,
            (QCAppEnvironment.shared().routing?.visibleViewController() is SeeAboutViewController) == false {
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
