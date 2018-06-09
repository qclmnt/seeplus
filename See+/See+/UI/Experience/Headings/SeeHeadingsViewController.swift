//
//  SeeHeadingsViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeHeadingsViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headingsCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    var headingsCollectionViewModel = SeeHeadingsCollectionViewModel()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLayout()
        
        self.headingsCollectionViewModel.delegate = self
        self.headingsCollectionViewModel.load()
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        // Title
        self.titleLabel.text = "What do you want to explore ?"
        
        // Next button
        self.nextButton.setTitle("next", for: .normal)
    }

    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.headingsCollectionView.reloadData()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeDismissRoutingEntry())
    }
    
}

extension SeeHeadingsViewController: QCViewModelDelegate {
    
    func viewModelDidStartLoad() {
        self.headingsCollectionViewModel.registerCellsAndReusableViews(on:self.headingsCollectionView)
        
        if self.headingsCollectionView.delegate == nil {
            self.headingsCollectionView.delegate = self.headingsCollectionViewModel
        }
        
        if self.headingsCollectionView.dataSource == nil {
            self.headingsCollectionView.dataSource = self.headingsCollectionViewModel
        }
        
        self.headingsCollectionView.reloadData()
    }
    
    func viewModelDidLoad() {
        self.headingsCollectionViewModel.registerCellsAndReusableViews(on:self.headingsCollectionView)
        
        UIView.animate(withDuration: 0, animations: {
            self.reloadDataView()
        }) { (finished) in
        }
        
    }
}
