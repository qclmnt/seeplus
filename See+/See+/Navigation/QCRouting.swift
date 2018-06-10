//
//  QCRouting.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class QCRouting: NSObject, QCNavigator {
    
    // MARK: - QCNavigator
    
    var lastRoutingEntry: QCRoutingEntry?
    
    func visibleViewController() -> UIViewController? {
        return QCAppEnvironment.shared().routing?.visibleViewController(AppDelegate.shared()?.window??.rootViewController)
        
    }
    
    func visibleViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        
        if let rootNavigationController = rootViewController as? UINavigationController {
            let lastViewController: UIViewController? = rootNavigationController.viewControllers.last
            return self.visibleViewController(lastViewController)
        } else if let rootTabBarController = rootViewController as? UITabBarController {
            let selectedViewController: UIViewController? = rootTabBarController.selectedViewController
            return visibleViewController(selectedViewController)
        }
        
        if rootViewController?.presentedViewController == nil {
            return rootViewController
        } else {
            return self.visibleViewController(rootViewController?.presentedViewController)
        }
    }
    
    func route(to entry: QCRoutingEntry) {
        self.route(to: entry, from: nil)
    }
    
    func route(to entry: QCRoutingEntry, from fromViewController: UIViewController?) {
        
        var fromVC = fromViewController
        
        if fromVC == nil {
            fromVC = QCAppEnvironment.shared().routing?.visibleViewController()
        }
        
        let viewControllerToDisplay = entry.viewController
        let animated: Bool = entry.animated
        let url = entry.url
        
        // Navigate on main thread to avoid crashes
        DispatchQueue.main.async(execute: {() -> Void in
            switch entry.navigationStyle {
            case .push:
                
                var fromNavigationController: UINavigationController? = fromVC as? UINavigationController
                
                if let navigationController = fromVC?.navigationController {
                    fromNavigationController = navigationController
                }
                if let aDisplay = viewControllerToDisplay {
                    fromNavigationController?.pushViewController(aDisplay, animated: animated)
                }
                
                break
                
            case .pop:
                fromVC?.navigationController?.popViewController(animated: animated)
                break
                
            case .modal:
                if let aDisplay = viewControllerToDisplay {
                    fromVC?.present(aDisplay, animated: animated,
                                    completion: {() -> Void in
                                        entry.completionBlock?()
                    })
                }
                
                break
                
            case .custom:
                entry.performCustomTransition()
                break
                
            case .openUrl:
                if let anUrlString = url,
                    let finalUrl = URL(string: anUrlString) {
                    if UIApplication.shared.canOpenURL(finalUrl) {
                        UIApplication.shared.open(finalUrl, options: [:], completionHandler: nil)
                    }
                }
                break
                
            case .preview:
                if let aDisplay = viewControllerToDisplay {
                    fromVC?.navigationController?.show(aDisplay, sender: nil)
                }
                break
                
            case .dismiss:
                fromVC?.dismiss(animated: animated, completion: {() -> Void in
                    entry.completionBlock?()
                })
                break
                
            case .selectTab:
                if let vcToDisplay = viewControllerToDisplay {
//                    AppDelegate.sharedInstance().iPhoneTabBarController?.selectIndex(for: vcToDisplay)
                }
                break
                
            }
        })
        
    }
    
}
