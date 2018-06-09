//
//  SeeDeleteExperienceRoutingEntry.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeDeleteExperienceRoutingEntry: QCRoutingEntry {
    
    let viewModel: SeeDeleteExperienceViewControllerViewModel
    
    // MARK: - Initialization
    
    init(viewModel: SeeDeleteExperienceViewControllerViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - QCRoutingEntry
    
    override var navigationStyle: QCNavigationStyle {
        return .modal
    }
    
    override var viewController: UIViewController? {
        
        let deleteExperienceViewController = SeeDeleteExperienceViewController(viewModel: self.viewModel)
        
        deleteExperienceViewController.modalPresentationStyle = .custom
        deleteExperienceViewController.transitioningDelegate = self
        
        return deleteExperienceViewController
    }

}

extension SeeDeleteExperienceRoutingEntry: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return SeeDeleteExperiencePresentationController(presentedViewController: presented,
                                                         presenting: presenting)
    }
}
