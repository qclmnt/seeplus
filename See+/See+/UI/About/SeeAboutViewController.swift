//
//  SeeAboutViewController.swift
//  See plus
//
//  Created by Quentin CLEMENT on 11/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeAboutViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textLabel.text = """
        Connect to a resident or a traveler from
        a big city and discover and share life in
        the metropolis.
        
        Propose or live a unique experience
        that suits you best.
        """
        
        self.navigationController?.setToolbarHidden(false, animated: false)
        self.navigationController?.toolbar.isTranslucent = false
        let flexItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let aboutImage = UIImage(named: "less-button")
        let aboutButtonItem = UIBarButtonItem(image: aboutImage,
                                              style: .plain,
                                              target: self,
                                              action: #selector(self.aboutButtonTouchUpInside))
        self.toolbarItems = [flexItem, aboutButtonItem]
        let _ = self.navigationController?.toolbar.addHorizontalGradientLayer(leftColor: .appRed(), rightColor: .purple)
    }
    
    // MARK: - Actions
    
    @objc func aboutButtonTouchUpInside() {
        QCAppEnvironment.shared().routing?.route(to: SeeDismissRoutingEntry())
    }

}
