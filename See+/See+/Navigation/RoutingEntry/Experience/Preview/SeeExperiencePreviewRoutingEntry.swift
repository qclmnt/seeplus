//
//  SeeExperiencePreviewRoutingEntry.swift
//  See plus
//
//  Created by Quentin CLEMENT on 16/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperiencePreviewRoutingEntry: QCRoutingEntry {
    
    let experience: SeeExperience
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }
    
    // MARK: - QCRoutingEntry
    
    override var navigationStyle: QCNavigationStyle {
        return .modal
    }
    
    override var viewController: UIViewController? {
        
        let deleteExperienceViewController = SeeExperiencePreviewViewController(experience: self.experience)
        
        deleteExperienceViewController.modalPresentationStyle = .custom
        deleteExperienceViewController.transitioningDelegate = self
        
        return deleteExperienceViewController
    }
    
}


extension SeeExperiencePreviewRoutingEntry: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return SeeExperiencePreviewPresentationController(presentedViewController: presented,
                                                         presenting: presenting)
    }
}


