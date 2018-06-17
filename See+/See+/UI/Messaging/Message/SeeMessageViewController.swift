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
    @IBOutlet weak var infoLabel: UILabel!
    
    
    lazy var messagesCollectionViewModel = SeeMessageBubblesCollectionViewModel()
    var bottomLine: CALayer?
    
    let user: SeeUser
    
    // MARK: - Initialization
    
    init(user: SeeUser) {
        self.user = user
        super.init(nibName: String(describing: SeeMessageViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.messagesCollectionViewModel.delegate = self
        self.messagesCollectionViewModel.load()
        
        self.usernameLabel.text = self.user.username
        
        self.bottomLine = self.topView.addBottomBorder(color: .appPurple(), borderWidth: 1)
        self.messageToolBar.configureWithStyle1(color: .appPurple())
        self.messageTextField.layer.borderColor = UIColor.appPurple().cgColor
        self.messageTextField.layer.borderWidth = 2
        self.messageTextField.layer.masksToBounds = true
        self.messageTextField.rightViewMode = .always
        let translateButton = UIButton(frame: CGRect(x: 40, y: 0, width: 30, height: 30))
        translateButton.setImage(UIImage(named: "translate-button"), for: .normal)
        translateButton.addTarget(self, action: #selector(self.translateButtonTouchUpInside), for: .touchUpInside)
        let sendButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        sendButton.setImage(UIImage(named: "send"), for: .normal)
        sendButton.addTarget(self, action: #selector(self.sendButtonTouchUpInside), for: .touchUpInside)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        view.addSubview(sendButton)
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
        
        guard let bottomLine = self.bottomLine else {return}
        bottomLine.frame = CGRect(x: bottomLine.frame.origin.x, y: self.topView.frame.height - bottomLine.frame.height, width: self.topView.frame.width, height: bottomLine.frame.height)
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
    
    @IBAction func notButtonTouchUpInside(_ sender: UIButton) {
        self.infoLabel.text = NSLocalizedString("decline.exp", comment: "")
    }
    
    @IBAction func validateButtonTouchUpInside(_ sender: UIButton) {
        self.infoLabel.text = NSLocalizedString("accepted.exp", comment: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.infoLabel.text = nil
            guard let image = UIImage(named: "load") else {return}
            let imageView = UIImageView(frame: CGRect(x: 10, y: self.infoLabel.frame.width-40, width: 50, height: 20))
            imageView.image = image
            print("load")
            self.infoLabel.addSubview(imageView)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.infoLabel.text = NSLocalizedString("other.accepted.exp", comment: "")
        }
    }
    
    
    @objc func sendButtonTouchUpInside() {
        self.messagesCollectionViewModel.addMessage(message: self.messageTextField.text ?? "Error")
        self.messageTextField.text = nil
        self.reloadDataView()
        self.scrollToBottom()
    }
    
    @objc func translateButtonTouchUpInside() {
        
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
