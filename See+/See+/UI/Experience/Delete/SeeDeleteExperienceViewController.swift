//
//  SeeDeleteExperienceViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeDeleteExperienceViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let viewModel: SeeDeleteExperienceViewControllerViewModel
    
    // MARK: - Initialization
    
    init(viewModel: SeeDeleteExperienceViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: SeeDeleteExperienceViewController.self),
                   bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.actionButton.layer.cornerRadius = self.actionButton.frame.height/2
        self.cancelButton.layer.cornerRadius = self.cancelButton.frame.height/2
        
        if let sublayers = self.cancelButton.layer.sublayers {
            for layer in sublayers {
                layer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.cancelButton.frame.width,
                                     height: self.cancelButton.frame.height)
            }
        }
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        self.view.layer.masksToBounds = true
        self.view.layer.borderWidth = DeviceHelper.isIpad() ? 2 : 1
        self.view.layer.borderColor = UIColor.appPurple().cgColor
        self.view.layer.cornerRadius = CGFloat(DeviceHelper.isIpad() ? 72 : 42)
        
        self.titleLabel.text = self.viewModel.title
        
        self.actionButton.setTitle(self.viewModel.actionButtonTitle, for: .normal)
        self.actionButton.layer.masksToBounds = true
        self.actionButton.layer.borderWidth = DeviceHelper.isIpad() ? 2 : 1
        self.actionButton.layer.borderColor = UIColor.appPurple().cgColor
        
        self.cancelButton.setTitle(self.viewModel.cancelButtonTitle, for: .normal)
        self.cancelButton.configureWithStyle1()
    }
    
    // MARK: - Actions
    
    @IBAction func actionButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel.action()
    }
    
    @IBAction func cancelButtonTouchUpInside(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("reloadDataView"), object: nil)
        QCAppEnvironment.shared().routing?.route(to: SeeDismissRoutingEntry())
    }
    
}
