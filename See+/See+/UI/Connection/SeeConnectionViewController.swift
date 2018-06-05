//
//  SeeConnectionViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeConnectionViewController: UIViewController {
    
    // MARK: - ViewModel
    
    let viewModel: SeeConnectionSignUpViewModel
    
    // MARK: - View
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var connectionFormView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    var gradientLayer: CAGradientLayer?
    
    // MARK: - Initialization
    
    init(viewModel: SeeConnectionSignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: SeeConnectionViewController.self),
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
        
        self.gradientLayer?.frame = self.view.bounds
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Background
        self.applyGradientLayer(view: self.view)
        
        // Title
        self.titleLabel.text = self.viewModel.title
        
        // Connection form
        self.usernameLabel.text = "Username"
        self.emailLabel.text = "Email"
        self.passwordLabel.text = "Password"
        self.confirmPasswordLabel.text = "Confirm password"
        
        self.confirmPasswordLabel.isHidden = !self.viewModel.shouldShowConfirmPassword
        self.confirmPasswordTextField.isHidden = !self.viewModel.shouldShowConfirmPassword
        
        // Buttons
        self.enterButton.setTitle("Enter", for: .normal)
        self.switchButton.setTitle(self.viewModel.switchButtonTitle, for: .normal)
    }
    
    // MARK: Actions
    
    @IBAction func enterButtonTouchUpInside(_ sender: UIButton) {
        self.viewModel.validateConnection(usernameText: self.usernameTextField.text) { (succeded) in
            if (succeded) {
                
            } else {
                print ("Connection error /!\\")
            }
        }
    }
    
    @IBAction func switchButtonTouchUpInside(_ sender: Any) {
        self.viewModel.switchConnectionMode()
    }
    
    // MARK: - Helper
    
    func applyGradientLayer(view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [self.viewModel.topBackgroundColor.cgColor, self.viewModel.bottomBackgroundColor.cgColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        self.gradientLayer = gradientLayer
    }

}
