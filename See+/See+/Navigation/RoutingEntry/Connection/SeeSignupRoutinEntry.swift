//
//  SeeSignupRoutinEntry.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeSignupRoutinEntry: QCRoutingEntry {
    
    var viewModel: SeeConnectionSignUpViewModel {
        return SeeConnectionSignUpViewModel()
    }

    // MARK: - QCRoutingEntry
    
    override var viewController: UIViewController? {
        return SeeConnectionViewController(viewModel: self.viewModel)
    }
    
}
