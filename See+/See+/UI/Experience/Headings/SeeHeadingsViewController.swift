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
    
    let headingsCollectionViewModel: SeeHeadingsCollectionViewModel
    var buttonGradient: CAGradientLayer?
    
    // MARK: - Initialization
    
    init(viewModel: SeeHeadingsCollectionViewModel) {
        self.headingsCollectionViewModel = viewModel
        super.init(nibName: String(describing: SeeHeadingsViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.nextButton.layer.masksToBounds = true
        self.buttonGradient = self.nextButton.addHorizontalGradientLayer(leftColor: .appRed(), rightColor: .appPurple())
        
        self.headingsCollectionView.allowsMultipleSelection = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.buttonGradient?.frame = self.nextButton.bounds
        self.nextButton.layer.cornerRadius = self.nextButton.frame.height/2
    }

    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.headingsCollectionView.reloadData()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        self.headingsCollectionViewModel.next()
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
