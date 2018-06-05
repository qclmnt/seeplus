//
//  SeeLoginRoutinEntry.swift
//  See+
//
//  Created by Quentin CLEMENT on 05/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeLoginRoutinEntry: SeeSignupRoutinEntry {
    
    // MARK: - SeeSignupRoutinEntry
    
    override var viewModel: SeeConnectionSignUpViewModel {
        return SeeConnectionLoginViewModel()
    }

}
