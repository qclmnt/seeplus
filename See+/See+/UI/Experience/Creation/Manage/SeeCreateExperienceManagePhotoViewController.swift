//
//  SeeCreateExperienceManagePhotoViewController.swift
//  See plus
//
//  Created by Quentin CLEMENT on 17/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeCreateExperienceManagePhotoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    lazy var viewModel = SeeExperiencesManagePhotoCollectionViewModel()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.viewModel.load()
    }
    
    // MARK: - Helper
    
    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.collectionView.reloadData()
        }
    }
    
}

extension SeeCreateExperienceManagePhotoViewController: QCViewModelDelegate {
    
    func viewModelDidStartLoad() {
        self.viewModel.registerCellsAndReusableViews(on:self.collectionView)
        
        if self.collectionView.delegate == nil {
            self.collectionView.delegate = self.viewModel
        }
        
        if self.collectionView.dataSource == nil {
            self.collectionView.dataSource = self.viewModel
        }
        
        self.collectionView?.reloadData()
    }
    
    func viewModelDidLoad() {
        self.viewModel.registerCellsAndReusableViews(on:self.collectionView)
        
        UIView.animate(withDuration: 0, animations: {
            self.reloadDataView()
        }) { (finished) in
        }
    }
}
