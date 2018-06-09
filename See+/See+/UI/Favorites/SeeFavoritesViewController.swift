//
//  SeeFavoritesViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeFavoritesViewController: SeeProfileViewController {
    
    override var viewModel: SeeTabBarViewControllerViewModel {
        return SeeFavoritesViewControllerViewModel()
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
