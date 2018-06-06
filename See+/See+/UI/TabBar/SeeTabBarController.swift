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
    
    init() {
        self.viewModel = SeeTabBarResidentControllerViewModel()
        super.init(nibName: String(describing: SeeTabBarController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers(self.viewModel.viewControllers, animated: true)
    }

}
