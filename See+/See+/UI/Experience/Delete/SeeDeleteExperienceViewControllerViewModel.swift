//
//  SeeDeleteExperienceViewControllerViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeDeleteExperienceViewControllerViewModel: QCViewControllerViewModel {
    
    var title: String {
        return "Do you want to delete this experience ?"
    }
    
    var actionButtonTitle: String {
        return "delete"
    }
    
    var cancelButtonTitle: String {
        return "cancel"
    }
    
    // MARK: - Action
    
    func action() {
        
    }

}
