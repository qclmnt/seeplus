//
//  SeeMessagingViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessagingViewController: SeeTabBarViewController {

    override var viewModel: SeeTabBarViewControllerViewModel {
        return SeeMessagingViewControllerViewModel()
    }
    
    lazy var messagingViewModel = SeeMessagingListCollectionViewModel()
    
    // MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messagingCollectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    
    var bottomLine: CALayer?
    
    // MARK: - Initialization
    
    override init() {
        super.init(nibName: String(describing: SeeMessagingViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureLayout()
        
        self.messagingViewModel.delegate = self
        self.messagingViewModel.load()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let bottomLine = self.bottomLine else {return}
        bottomLine.frame = CGRect(x: bottomLine.frame.origin.x, y: self.headerView.frame.height - bottomLine.frame.height, width: self.headerView.frame.width, height: bottomLine.frame.height)
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Title View
        self.titleLabel.text = "My messages"
        
        // Header view
        self.bottomLine = self.headerView.addBottomBorder(color: .appPurple(), borderWidth: 1)
    }
    
    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.messagingCollectionView.reloadData()
        }
    }

}

extension SeeMessagingViewController: QCViewModelDelegate {
    
    func viewModelDidStartLoad() {
        self.messagingViewModel.registerCellsAndReusableViews(on:self.messagingCollectionView)
        
        if self.messagingCollectionView.delegate == nil {
            self.messagingCollectionView.delegate = self.messagingViewModel
        }
        
        if self.messagingCollectionView.dataSource == nil {
            self.messagingCollectionView.dataSource = self.messagingViewModel
        }
        
        self.messagingCollectionView?.reloadData()
    }
    
    func viewModelDidLoad() {
        self.messagingViewModel.registerCellsAndReusableViews(on:self.messagingCollectionView)
        
        UIView.animate(withDuration: 0, animations: {
            self.reloadDataView()
        }) { (finished) in
        }
    }
}
