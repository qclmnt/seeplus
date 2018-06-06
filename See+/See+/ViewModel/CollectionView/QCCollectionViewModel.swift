//
//  QCCollectionViewModel.swift
//  See+
//
//  Created by Quentin CLEMENT on 06/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class QCCollectionViewModel: QCViewControllerViewModel, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var flowLayout = QCCollectionViewFlowLayout()
    lazy var sections = [QCCollectionViewSection]()

    weak var collectionViewModelDelegate: QCCollectionViewModelDelegate? {
        get {
            return self.delegate as? QCCollectionViewModelDelegate
        }
        set {}
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection {
            return currentSection.items.count
        }
        
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection {
            if let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel {
                item.indexPath = indexPath
                let reuseIdentifier = item.reuseIdentifier()
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
                item.configureCell(cell, collectionView: collectionView)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection,
            currentSection.items.count > indexPath.row,
            let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel else {
                return
        }
        item.willDisplayCell(cell)
        self.visibleItems.add(item)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection,
            currentSection.items.count > indexPath.row,
            let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel else {
                return
        }
        item.didEndDisplaying(cell)
        if self.visibleItems.contains(item) {
            self.visibleItems.remove(item)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection else {
                return UICollectionReusableView()
        }
        
        if kind == UICollectionElementKindSectionHeader {
            guard let headerModel = currentSection.header else { return UICollectionReusableView() }
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: headerModel.supplementaryElementKind,
                                                                             withReuseIdentifier: headerModel.reuseIdentifier, for: indexPath)
            headerModel.configureView(view: headerView)
            return headerView
        } else {
            guard let footerModel = currentSection.footer else { return UICollectionReusableView() }
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: footerModel.supplementaryElementKind,
                                                                             withReuseIdentifier: footerModel.reuseIdentifier, for: indexPath)
            footerModel.configureView(view: footerView)
            return footerView
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection,
            let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel else {
                return
        }
        
        item.didSelect(from: self.delegate as? UIViewController)
    }
    
    // MARK: - UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection else {
                return
        }
        
        if elementKind == QCDecorationCollectionReusableViewModel.decorationViewOfKind {
            guard let headerModel = currentSection.decoration,
                let headerView = view as? QCDecorationCollectionReusableView else { return }
            
            headerView.configure(viewModel: headerModel)
        }
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return 0
        }
        return currentSection.minimumLineSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return 0
        }
        
        return currentSection.minimumInteritemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return UIEdgeInsets.zero
        }
        return currentSection.edgeInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard self.sections.count > indexPath.section,
            let currentSection = self.sections[indexPath.section] as? QCCollectionViewSection,
            let item = currentSection.items[indexPath.row] as? QCCollectionCellViewModel else {
                return CGSize.zero
        }
        
        let collectionWidth = collectionView.bounds.size.width
        let widthMinusEdgeInsets = collectionWidth - currentSection.edgeInsets.left - currentSection.edgeInsets.right
        let widthMinusInterItemSpacing = widthMinusEdgeInsets - (currentSection.minimumInteritemSpacing * CGFloat(currentSection.numberOfColumns-1))
        let maxWidth = widthMinusInterItemSpacing/CGFloat(currentSection.numberOfColumns) - 1
        let itemSize = item.cellSize(maxSize: CGSize(width: maxWidth, height: collectionView.bounds.size.height))
        
        if DeviceHelper.isIpad(),
            let decoration = currentSection.decoration {
            if decoration.decorationViewInfos == nil {
                decoration.decorationViewInfos = QCDecorationViewInfos(collectionViewWidth: collectionWidth,
                                                                        numberOfColumns: currentSection.numberOfColumns,
                                                                        sectionEdgeInsets: currentSection.edgeInsets)
                let indexPathKey = NSIndexPath(row: 0, section: indexPath.section)
                self.flowLayout.decorationsInfos[indexPathKey] = decoration.decorationViewInfos
            }
            decoration.decorationViewInfos?.addSectionItemHeight(item: indexPath.item, height: itemSize.height)
        }
        
        return itemSize
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return CGSize.zero
        }
        
        guard let headerModel = currentSection.header else { return CGSize.zero }
        return headerModel.viewSize(maxSize: collectionView.bounds.size)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard self.sections.count > section,
            let currentSection = self.sections[section] as? QCCollectionViewSection else {
                return CGSize.zero
        }
        
        guard let footerModel = currentSection.footer else { return CGSize.zero }
        return footerModel.viewSize(maxSize: collectionView.bounds.size)
    }
    
    // MARK: - Register Cell
    
    @objc open func registerCellsAndReusableViews(on collectionView: UICollectionView) {
        guard let sections = self.sections as NSArray as? [QCCollectionViewSection] else {
            return
        }
        
        for section in sections {
            // Header
            if let header = section.header {
                header.register(on: collectionView)
            }
            
            // Cells
            if let items = section.items as NSArray as? [QCCollectionCellViewModel]  {
                for item in items {
                    item.registerCell(collectionView)
                }
            }
            
            // Footer
            if let footer = section.footer {
                footer.register(on: collectionView)
            }
            
            // Decoration view
            if let decoration = section.decoration {
                decoration.register(on: collectionView)
            }
        }
    }
    
    // MARK: - UIScrollViewDelegate
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.delegate?.scrollViewDidScroll?(scrollView)
    }
    
}
