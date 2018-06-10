//
//  SeeTabBarController.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeTabBarController: UITabBarController {
    
    let viewModel: SeeTabBarResidentControllerViewModel
    
    // MARK: - Initialization
    
    init(viewModel: SeeTabBarResidentControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: SeeTabBarController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let navigationViewControllers = self.viewModel.viewControllers.map { (viewController) -> UINavigationController in
            return SeeNavigationController(rootViewController: viewController)
        }
        self.setViewControllers(navigationViewControllers, animated: true)
        
//        if let viewControllers = self.viewControllers {
//            for viewController in viewControllers {
//                if let tabBarViewController = viewController as? SeeTabBarViewController {
//                    viewController.tabBarItem = UITabBarItem(title: tabBarViewController.viewModel.title,
//                                                             image: nil,
//                                                             selectedImage: nil)
//                }
//            }
//        }
        
    }

}
