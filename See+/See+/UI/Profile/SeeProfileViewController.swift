//
//  SeeProfileViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileViewController: SeeTabBarViewController {

    override var viewModel: SeeTabBarViewControllerViewModel {
        return SeeProfileViewControllerViewModel()
    }
    
    lazy var experiencesViewModel = SeeProfileExperiencesCollectionViewModel()
    
    // MARK: - Views
    
    @IBOutlet weak var profilPicImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var plusImageView: UIImageView!
    @IBOutlet weak var experiencesCollectionView: UICollectionView!
    
    // MARK: - Initialization
    
    override init() {
        super.init(nibName: String(describing: SeeProfileViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.experiencesViewModel.delegate = self
        self.experiencesViewModel.load()
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Username
        self.usernameLabel.text = "My profile"
    }
    
    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.experiencesCollectionView.reloadData()
        }
    }

}

extension SeeProfileViewController: QCViewModelDelegate {
    
    func viewModelDidStartLoad() {
        self.experiencesViewModel.registerCellsAndReusableViews(on:self.experiencesCollectionView)
        
        if self.experiencesCollectionView.delegate == nil {
            self.experiencesCollectionView.delegate = self.experiencesViewModel
        }
        
        if self.experiencesCollectionView.dataSource == nil {
            self.experiencesCollectionView.dataSource = self.experiencesViewModel
        }
        
        self.experiencesCollectionView?.reloadData()
    }
    
    func viewModelDidLoad() {
        self.experiencesViewModel.registerCellsAndReusableViews(on:self.experiencesCollectionView)
        
        UIView.animate(withDuration: 0, animations: {
            self.reloadDataView()
        }) { (finished) in
        }
        
        self.navigationItem.title = self.viewModel.title
    }
}
