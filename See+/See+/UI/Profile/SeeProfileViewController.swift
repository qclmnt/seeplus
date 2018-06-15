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
        return SeeMode.activatedMode() == .propose ? SeeProfileResidentViewControllerViewModel() : SeeProfileTravellerViewControllerViewModel()
    }
    
    var profileViewModel: SeeProfileViewControllerViewModel? {
        return self.viewModel as? SeeProfileViewControllerViewModel
    }
    
    lazy var experiencesViewModel = SeeProfileExperiencesCollectionViewModel(shouldShowDeleteButton: self.profileViewModel?.shouldShowDeleteButtonOnExperience ?? false)
    
    // MARK: - Views
    
    @IBOutlet weak var profilPicImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
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

        self.configureLayout()
        
        self.experiencesViewModel.delegate = self
        self.experiencesViewModel.load()
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        guard let profileViewModel = self.profileViewModel else { return }
        
        // Username
        self.usernameLabel.text = profileViewModel.pageTitle
        
        // Image
        self.profilPicImageView.image = UIImage(named: profileViewModel.image)
        
        // Logged out
        self.moreButton.isHidden = !profileViewModel.shouldShowLoggedOut
    }
    
    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.experiencesCollectionView.reloadData()
        }
    }
    
    // MARK: - Actions

    @IBAction func moreButtonTouchUpInside(_ sender: UIButton) {
        guard let profileViewModel = self.viewModel as? SeeProfileViewControllerViewModel else { return }
        profileViewModel.logOut()
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
    }
}
