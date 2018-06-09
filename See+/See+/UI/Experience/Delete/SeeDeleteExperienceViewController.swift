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
    
    // MARK: - Configure
    
    func configureLayout() {
        self.titleLabel.text = self.viewModel.title
        self.actionButton.setTitle(self.viewModel.actionButtonTitle, for: .normal)
        self.cancelButton.setTitle(self.viewModel.cancelButtonTitle, for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func actionButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel.action()
    }
    
    @IBAction func cancelButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeeDismissRoutingEntry())
    }
    
}
