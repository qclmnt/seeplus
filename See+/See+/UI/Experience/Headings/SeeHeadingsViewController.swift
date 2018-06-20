//
//  SeeHeadingsViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

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
        self.titleLabel.text = self.headingsCollectionViewModel.title
        
        // Next button
        self.nextButton.setTitle(NSLocalizedString("next", comment: ""), for: .normal)
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
        
        var headings = [Int]()
        if let indexPaths = self.headingsCollectionView.indexPathsForSelectedItems {
            for indexPath in indexPaths {
                headings.append(indexPath.row)
            }
        }
        Defaults[.selectedHeadings] = SeeMode.activatedMode() == .discover ? headings : [0,1,2,3,4,5]
        NotificationCenter.default.post(name: Notification.Name("reloadExp"), object: nil)

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
