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
    
    lazy var experiencesViewModel = SeeProfileExperiencesCollectionViewModel(shouldShowDeleteButton: self.profileViewModel?.shouldShowDeleteButtonOnExperience ?? false, borderColor: self.color)
    
    lazy var color: UIColor = {
        let mode = self.username != nil ? UserMode.discover : SeeMode.activatedMode()
        return SeeMode.colorForActivatedMode(mode: mode)
    }()
    
    // MARK: - Views
    
    @IBOutlet weak var profilPicImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var experiencesCollectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    
    var borderLayer: CALayer?
    let username: String?
    
    // MARK: - Initialization
    
    init(username: String?) {
        self.username = username
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadDataView), name: Notification.Name("reloadDataView"), object: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let layer = self.borderLayer else {return}
        layer.frame = CGRect(x: layer.frame.origin.x, y: layer.frame.origin.y, width: self.headerView.frame.size.width, height: layer.bounds.height)
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        self.borderLayer = self.headerView.addBottomBorder(color: self.color, borderWidth: 1)
        
        guard let profileViewModel = self.profileViewModel else { return }
        
        // Username
        self.usernameLabel.text = self.username != nil ? self.username : profileViewModel.pageTitle
        self.usernameLabel.textColor = self.color
        
        // Image
        self.profilPicImageView.image = UIImage(named: profileViewModel.image)
        
        // Logged out
        self.moreButton.isHidden = !profileViewModel.shouldShowLoggedOut
    }
    
    @objc func reloadDataView() {
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
