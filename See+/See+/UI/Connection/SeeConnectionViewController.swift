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
        
        for textField in [self.usernameTextField,
                          self.emailTextField,
                          self.passwordTextField,
                          self.confirmPasswordTextField] {
                            
                            guard let field = textField,
                                let sublayers = textField?.layer.sublayers else {
                                continue
                            }
                            
                            for layer in sublayers {
                                layer.frame = CGRect(x: layer.frame.origin.x,
                                                     y: layer.frame.origin.y,
                                                     width: field.frame.width,
                                                     height: layer.frame.size.height)
                            }
            
        }
        
        self.switchButton.layer.cornerRadius = self.switchButton.frame.size.height/2
        self.enterButton.layer.cornerRadius = self.enterButton.frame.size.height/2
    }
    
    // MARK: - Configure
    
    func configureLayout() {
        
        // Background
        self.gradientLayer = self.view.addGradientLayer(bottomColor: self.viewModel.bottomBackgroundColor,
                                                        topColor: self.viewModel.topBackgroundColor)
        
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
        self.enterButton.setTitle("enter", for: .normal)
        self.enterButton.layer.masksToBounds = true
        self.switchButton.setTitle(self.viewModel.switchButtonTitle, for: .normal)
        self.switchButton.layer.borderWidth = 1
        self.switchButton.layer.borderColor = UIColor.white.cgColor
        self.switchButton.layer.masksToBounds = true
        
        // Line on textfields
        for textField in [self.usernameTextField,
                          self.emailTextField,
                          self.passwordTextField,
                          self.confirmPasswordTextField] {
                            
                            guard let field = textField else {
                                    continue
                            }
                            
                            field.addBottomBorder(color: .white, borderWidth: 1)
                            field.tintColor = .white
                            
        }
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

}
