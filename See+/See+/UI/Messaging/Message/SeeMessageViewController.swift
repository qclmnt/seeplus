//
//  SeeMessageViewController.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeMessageViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messagingCollectionView: UICollectionView!
    @IBOutlet weak var messageToolBar: UIView!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var messageTextField: SeeTextField!
    @IBOutlet weak var messageToolBarBottomConstraint: NSLayoutConstraint!
    
    lazy var messagesCollectionViewModel = SeeMessageBubblesCollectionViewModel()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.messagesCollectionViewModel.delegate = self
        self.messagesCollectionViewModel.load()
        
        self.topView.configureWithStyle1(color: .appPurple())
        self.messageToolBar.configureWithStyle1(color: .appPurple())
        self.messageTextField.configureWithStyle1(color: .appPurple())
        self.messageTextField.layer.masksToBounds = true
        self.messageTextField.rightViewMode = .always
        let translateButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        translateButton.setImage(UIImage(named: "translate-button"), for: .normal)
        translateButton.addTarget(self, action: #selector(self.translateButtonTouchUpInside), for: .touchUpInside)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        view.addSubview(translateButton)
        self.messageTextField.rightView = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        NotificationCenter.removeObserver(self)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.messageTextField.layer.cornerRadius = self.messageTextField.bounds.size.height/2
    }
    
    // MARK: - Keyboard notifications
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            self.messageToolBarBottomConstraint.constant = keyboardSize.cgRectValue.size.height-44 // 44 is tabbar height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.messageToolBarBottomConstraint.constant = 0
    }
    
    func reloadDataView() {
        UIView.performWithoutAnimation {
            self.messagingCollectionView.reloadData()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        QCAppEnvironment.shared().routing?.route(to: SeePopRoutingEntry())
    }
    
    @objc func translateButtonTouchUpInside() {
        self.messagesCollectionViewModel.addMessage(message: self.messageTextField.text ?? "Error")
        self.reloadDataView()
        self.scrollToBottom()
    }
    
    func scrollToBottom() {
        let item = self.messagingCollectionView.numberOfItems(inSection: 0)-1
        let lastItemIndex = IndexPath(item: item, section: 0)
        self.messagingCollectionView.scrollToItem(at: lastItemIndex, at: .bottom, animated: true)
    }
}

extension SeeMessageViewController: QCViewModelDelegate {
    
    func viewModelDidStartLoad() {
        self.messagesCollectionViewModel.registerCellsAndReusableViews(on:self.messagingCollectionView)
        
        if self.messagingCollectionView.delegate == nil {
            self.messagingCollectionView.delegate = self.messagesCollectionViewModel
        }
        
        if self.messagingCollectionView.dataSource == nil {
            self.messagingCollectionView.dataSource = self.messagesCollectionViewModel
        }
        
        self.messagingCollectionView.reloadData()
    }
    
    func viewModelDidLoad() {
        self.messagesCollectionViewModel.registerCellsAndReusableViews(on:self.messagingCollectionView)
        
        UIView.animate(withDuration: 0, animations: {
            self.reloadDataView()
        }) { (finished) in
        }
    }
}
