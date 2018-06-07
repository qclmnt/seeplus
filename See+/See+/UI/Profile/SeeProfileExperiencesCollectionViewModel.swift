//
//  SeeProfileExperiencesCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileExperiencesCollectionViewModel: QCCollectionViewModel {
    
    override func load() {
        self.delegate?.viewModelDidStartLoad()
        self.loadSection()
        self.delegate?.viewModelDidLoad()
    }
    
    func loadSection() {
        self.sections = [SeeProfileExperiencesSection()]
    }

}
