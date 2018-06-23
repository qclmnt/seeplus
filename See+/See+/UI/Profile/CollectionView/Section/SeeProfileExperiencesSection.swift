//
//  SeeProfileExperiencesSection.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeProfileExperiencesSection: QCCollectionViewSection {
    
    let shouldShowDeleteButton: Bool
    let borderColor: UIColor
    
    // MARK: - Initialization
    
    init(shouldShowDeleteButton: Bool,
         borderColor: UIColor) {
        self.shouldShowDeleteButton = shouldShowDeleteButton
        self.borderColor = borderColor
        super.init()
    }
    
    // MARK: - QCCollectionViewSection
    
    override var edgeInsets: UIEdgeInsets {
        return UIEdgeInsetsMake(26, DeviceHelper.isIpad() ? 92.5 : 30, 0, DeviceHelper.isIpad() ? 92.5 : 30)
    }
    
    override var numberOfColumns: Int {
        return 2
    }
    
    override var minimumLineSpacing: CGFloat {
        return DeviceHelper.isIpad() ? 52 : 26
    }
    
    override var minimumInteritemSpacing: CGFloat {
        return DeviceHelper.isIpad() ? 60 : 0
    }
    
    override func setup() {
        
        let experiences = SeeMode.experiences(rubric: SeeMode.activatedMode() == .discover ? (self.shouldShowDeleteButton ? .castle : .cinema): .art)
        var expCellModels = [SeeProfileExperienceCollectionViewCellViewModel]()
        for exp in experiences {
            expCellModels.append(SeeProfileExperienceCollectionViewCellViewModel(experience: exp,
                                                                                 shouldShowDeleteButton: self.shouldShowDeleteButton,
                                                                                 borderColor: self.borderColor))
        }
        
        self.items = expCellModels
    }

}
