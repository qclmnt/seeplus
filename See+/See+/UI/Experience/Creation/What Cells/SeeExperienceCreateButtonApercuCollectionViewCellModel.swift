//
//  SeeExperienceCreateButtonApercuCollectionViewCellModel.swift
//  See plus
//
//  Created by Quentin CLEMENT on 17/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class SeeExperienceCreateButtonApercuCollectionViewCellModel: SeeExperienceCreateButtonCollectionViewCellModel {

    override func cellSize(maxSize: CGSize) -> CGSize {
        let width = CGFloat(DeviceHelper.isIpad() ? 412 : 243)
        let height = CGFloat(DeviceHelper.isIpad() ? 54.5 : 32)
        return CGSize(width: width, height: height)
    }
}
