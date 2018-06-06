//
//  SeeFavoritesViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeFavoritesViewController: SeeTabBarViewController {
    
    override var viewModel: SeeTabBarViewControllerViewModel {
        return SeeFavoritesViewControllerViewModel()
    }
    
    // MARK: - Initialization
    
    override init() {
        super.init(nibName: String(describing: SeeFavoritesViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
