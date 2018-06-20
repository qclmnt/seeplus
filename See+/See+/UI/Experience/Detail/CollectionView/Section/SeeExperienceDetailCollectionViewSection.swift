//
//  SeeExperienceDetailCollectionViewSection.swift
//  See plus
//
//  Created by Quentin CLEMENT on 12/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceDetailCollectionViewSection: QCCollectionViewSection {
    
    let experience: SeeExperience
    
    // MARK: - Initialization
    
    init(experience: SeeExperience) {
        self.experience = experience
        super.init()
    }
    
    // MARK: - QCCollectionViewSection
    
    override var edgeInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
    }
    
    override var minimumLineSpacing: CGFloat {
        return 30
    }
    
    override func setup() {
        self.items = [SeeExperienceDetailCollectionViewCellModel(experience: self.experience),
        SeeTextCollectionViewCellViewModel(text: self.experience.desc),
        SeeExperienceImage(image: self.experience.image2),
        SeeExperienceImage(image: self.experience.image3),
        SeeContactExperienceAuthorCollectionViewCellViewModel(experience: self.experience),
        SeeTextCollectionViewCellViewModel(text: self.experience.desc, textAlignement: .left, attributedString: self.experienceReview())]
    }
    
    // MARK: - Helper
    
    func experienceReview() -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: "Avis des utilisateurs\n\nJamilabb : ", attributes: [NSAttributedStringKey.font: UIFont(name: "Gotham-Medium", size: 20)!])
        
        mutableAttributedString.append(NSAttributedString(string: "Jean-Michel was friendly,\nthe experience has been interesting!\n\n", attributes: [NSAttributedStringKey.font: UIFont(name: "Gotham-Book", size: 20)!]))
        
        mutableAttributedString.append(NSAttributedString(string: "aporobert : ", attributes: [NSAttributedStringKey.font: UIFont(name: "Gotham-Medium", size: 20)!]))
        
        mutableAttributedString.append(NSAttributedString(string: "J’ai adoré ce moment avec JeanMi! Je recommande!", attributes: [NSAttributedStringKey.font: UIFont(name: "Gotham-Book", size: 20)!]))
        
        return mutableAttributedString
    }

}
