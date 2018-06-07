//
//  QCCollectionCellViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 07/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class QCCollectionCellViewModel: NSObject {
    
    var cellForSize: UICollectionViewCell?
    
    var routingEntry: QCRoutingEntry {
        return QCRoutingEntry()
    }
    
    var reuseIdentifier: String {
        return String(describing: UICollectionViewCell.self)
    }
    
    lazy var cellNib: UINib = {
        return UINib(nibName: String(describing: self.reuseIdentifier),
                     bundle: Bundle.main)
    }()

    func cellSize(maxSize: CGSize) -> CGSize {
        
        if self.cellForSize == nil,
            self.reuseIdentifier.count > 0,
            let cell = Bundle.main.loadNibNamed(self.reuseIdentifier, owner: self, options: nil)?.first as? UICollectionViewCell {
            
            self.cellForSize = cell
        }
        
        guard let cell = self.cellForSize else {
            return CGSize.zero
        }
        
        cell.prepareForReuse()
        
        cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: maxSize.width, height: cell.frame.size.height)
        self.configureCell(cell, collectionView: nil)
        
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        var finalSize = CGSize(width: maxSize.width, height: cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height)
        
        if finalSize.height > maxSize.height {
            finalSize.height = maxSize.height
        }
        
        return finalSize
    }
    
    func configureCell(_ cell: UICollectionViewCell, collectionView: UICollectionView?) {
        // Override in subclasses
    }
    
    func willDisplayCell(_ cell: UICollectionViewCell) {
        // Override in subclasses
    }
    
    func didEndDisplaying(_ cell: UICollectionViewCell) {
        // Override in subclasses
    }
    
    func didSelect(from: UIViewController?) {
        QCAppEnvironment.shared().routing?.route(to: self.routingEntry)
    }
    
    // MARK: - YMMCellViewModel
    
    func registerCell(_ collectionView: UICollectionView) {
        collectionView.register(self.cellNib,
                                forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
}
