//
//  SeeExperienceDetailViewController.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceDetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    lazy var collectionViewModel = SeeExperienceDetailViewControllerCollectionViewModel(experience: self.experience)
    let collectionViewModel: SeeExperienceDetailViewControllerCollectionViewModel
    
    // MARK: - Initialization
    
    init(viewModel: SeeExperienceDetailViewControllerCollectionViewModel) {
        self.collectionViewModel = viewModel
        super.init(nibName: String(describing: SeeExperienceDetailViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionViewModel.delegate = self
        self.collectionViewModel.load()
    }
    
    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.collectionView.reloadData()
        }
    }
}

extension SeeExperienceDetailViewController: QCViewModelDelegate {
    
    func viewModelDidStartLoad() {
        self.collectionViewModel.registerCellsAndReusableViews(on:self.collectionView)
        
        if self.collectionView.delegate == nil {
            self.collectionView.delegate = self.collectionViewModel
        }
        
        if self.collectionView.dataSource == nil {
            self.collectionView.dataSource = self.collectionViewModel
        }
        
        self.collectionView.reloadData()
    }
    
    func viewModelDidLoad() {
        self.collectionViewModel.registerCellsAndReusableViews(on:self.collectionView)
        
        UIView.animate(withDuration: 0, animations: {
            self.reloadDataView()
        }) { (finished) in
        }
    }
}

