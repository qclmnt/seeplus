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
    
    
    var translateActivated: Bool = false
    lazy var languagePicker: UIPickerView = UIPickerView()
    let languages: [String] = [NSLocalizedString("french", comment: ""),
                               NSLocalizedString("chinois", comment: ""),
                               NSLocalizedString("dutch", comment: ""),
                               NSLocalizedString("english", comment: ""),
                               NSLocalizedString("spanish", comment: ""),
                               NSLocalizedString("russia", comment: ""),
                               NSLocalizedString("port", comment: ""),
                               NSLocalizedString("jap", comment: ""),
                               NSLocalizedString("arabic", comment: "")]
    
    let user: SeeUser
    lazy var color = SeeMode.activatedMode() == .propose ? UIColor.appPurple() : UIColor.appRed()
    
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
        self.usernameLabel.textColor = self.color
        
        self.bottomLine = self.topView.addBottomBorder(color: self.color, borderWidth: 1)
        self.messageToolBar.configureWithStyle1(color: self.color)
        self.messageTextField.layer.borderColor = self.color.cgColor
        self.messageTextField.layer.borderWidth = DeviceHelper.isIpad() ? 2 : 1
        self.messageTextField.layer.masksToBounds = true
        self.messageTextField.rightViewMode = .always
        let widthButton = DeviceHelper.isIpad() ? 30 : 25
        let translateButton = UIButton(frame: CGRect(x: widthButton + 8, y: 0, width: widthButton, height: widthButton))
        translateButton.setImage(UIImage(named: "translate-button"), for: .normal)
        translateButton.addTarget(self, action: #selector(self.translateButtonTouchUpInside), for: .touchUpInside)
        let sendButton = UIButton(frame: CGRect(x: 0, y: 0, width: widthButton, height: widthButton))
        sendButton.setImage(UIImage(named: "send"), for: .normal)
        sendButton.addTarget(self, action: #selector(self.sendButtonTouchUpInside), for: .touchUpInside)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: widthButton*2+20, height: widthButton))
        view.addSubview(sendButton)
        view.addSubview(translateButton)
        self.messageTextField.rightView = view
        
        self.profilePicImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.goProfil)))
        self.usernameLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.goProfil)))
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
        self.noButton.setImage(UIImage(named: "deleteSelected"), for: .normal)
    }
    
    @IBAction func validateButtonTouchUpInside(_ sender: UIButton) {
        self.infoLabel.text = NSLocalizedString("accepted.exp", comment: "")
        self.yesButton.setImage(UIImage(named: "yesSelected"), for: .normal)
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
    
    @objc func goProfil() {
        QCAppEnvironment.shared().routing?.route(to: SeeProfileRoutingEntry(user: self.user))
    }
    
    @objc func sendButtonTouchUpInside() {
        self.messagesCollectionViewModel.addMessage(message: self.messageTextField.text ?? "Error")
        self.messageTextField.text = nil
        self.reloadDataView()
        self.scrollToBottom()
    }
    
    @objc func translateButtonTouchUpInside() {
        if self.translateActivated {
            self.messageTextField.inputView = nil
            self.messageTextField.becomeFirstResponder()
        } else {
            self.languagePicker.delegate = self
            self.languagePicker.dataSource = self
            self.messageTextField.inputView = self.languagePicker
            self.messageTextField.becomeFirstResponder()
        }
        
        self.translateActivated = !self.translateActivated
    }
    
    func scrollToBottom() {
        let item = self.messagingCollectionView.numberOfItems(inSection: 0)-1
        let lastItemIndex = IndexPath(item: item, section: 0)
        self.messagingCollectionView.scrollToItem(at: lastItemIndex, at: .bottom, animated: true)
    }
}

extension SeeMessageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.languages.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.languages[row]
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
