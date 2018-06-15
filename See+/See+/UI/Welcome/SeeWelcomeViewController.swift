//
//  SeeWelcomeViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeWelcomeViewController: UIViewController {
    
    // MARK: - View
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    let viewModel: SeeWelcomeViewControllerViewModel
    
    // MARK: - Initialization
    
    init(viewModel: SeeWelcomeViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: SeeWelcomeViewController.self), bundle: nil)
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
        
        for button in [self.nextButton] {
                        
                        guard let button = button,
                            let sublayers = button.layer.sublayers else {
                                continue
                        }
                        
                        button.layer.cornerRadius = button.frame.height/2
                        
                        for layer in sublayers {
                            layer.frame = CGRect(x: 0,
                                                 y: 0,
                                                 width: button.frame.width,
                                                 height: button.frame.height)
                        }
        }
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Title
        self.titleLabel.text = self.viewModel.title
        
        // Info
        self.infoLabel.text = self.viewModel.info
        
        // Next Button
        self.nextButton.setTitle(self.viewModel.buttonTitle, for: .normal)
        self.nextButton.configureWithStyle1()
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel.buttonAction()
    }
    

}
