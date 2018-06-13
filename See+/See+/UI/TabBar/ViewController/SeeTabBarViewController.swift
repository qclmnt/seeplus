//
//  SeeTabBarViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeTabBarViewController: UIViewController {
    
    var viewModel: SeeTabBarViewControllerViewModel {
        return SeeTabBarViewControllerViewModel()
    }
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: String(describing: SeeTabBarViewController.self),
                   bundle: nil)
        self.initInfos()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil,
                   bundle: nibBundleOrNil)
        self.initInfos()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initInfos() {
        self.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: self.viewModel.tabbarItemImage), tag: 0)
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
