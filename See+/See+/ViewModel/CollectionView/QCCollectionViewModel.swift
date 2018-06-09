//
//  QCCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class QCCollectionViewModel: QCViewControllerViewModel, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var delegate: QCViewModelDelegate?
    lazy var flowLayout = UICollectionViewFlowLayout()
    lazy var sections = [QCCollectionViewSection]()
    
    // MARK: - QCViewModel
    
    override func load() {
        self.delegate?.viewModelDidStartLoad()
        self.loadSections()
        self.delegate?.viewModelDidLoad()
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.sections.count > section {
            let currentSection = self.sections[section]
            return currentSection.items.count
        }
        
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.sections.count > indexPath.section {
            let currentSection = self.sections[indexPath.section]
            let item = currentSection.items[indexPath.row]
            //                item.indexPath = indexPath
            let reuseIdentifier = item.reuseIdentifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            item.configureCell(cell, collectionView: collectionView)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section else {
                return
        }
        let currentSection = self.sections[indexPath.section]
        guard currentSection.items.count > indexPath.row else {
            return
        }
        let item = currentSection.items[indexPath.row]
        item.willDisplayCell(cell)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section else {return}
        let currentSection = self.sections[indexPath.section]
        guard currentSection.items.count > indexPath.row else {
            return
        }
        let item = currentSection.items[indexPath.row]
        item.didEndDisplaying(cell)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section else {
                return
        }
        
        let currentSection = self.sections[indexPath.section]
        let item = currentSection.items[indexPath.row]
        item.didSelect(from: nil)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard self.sections.count > section else {
                return 0
        }
        let currentSection = self.sections[section]
        return currentSection.minimumLineSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard self.sections.count > section else {
                return 0
        }
        
        let currentSection = self.sections[section]
        return currentSection.minimumInteritemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard self.sections.count > section else {
                return UIEdgeInsets.zero
        }
        let currentSection = self.sections[section]
        return currentSection.edgeInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard self.sections.count > indexPath.section else {
                return CGSize.zero
        }

        let currentSection = self.sections[indexPath.section]
        let item = currentSection.items[indexPath.row]
        
        let collectionWidth = collectionView.bounds.size.width
        let widthMinusEdgeInsets = collectionWidth - currentSection.edgeInsets.left - currentSection.edgeInsets.right
        let widthMinusInterItemSpacing = widthMinusEdgeInsets - (currentSection.minimumInteritemSpacing * CGFloat(currentSection.numberOfColumns-1))
        let maxWidth = widthMinusInterItemSpacing/CGFloat(currentSection.numberOfColumns) - 1
        let itemSize = item.cellSize(maxSize: CGSize(width: maxWidth, height: collectionView.bounds.size.height))
        
        return itemSize
    }
    
    // MARK: - Register Cell
    
    @objc open func registerCellsAndReusableViews(on collectionView: UICollectionView) {
        guard let sections = self.sections as NSArray as? [QCCollectionViewSection] else {
            return
        }
        
        for section in sections {
            
            // Cells
            if let items = section.items as NSArray as? [QCCollectionCellViewModel]  {
                for item in items {
                    item.registerCell(collectionView)
                }
            }
        }
    }
    
    // MARK: - Sections
    
    func loadSections() {
        // Override in subclasses
    }
    
}
