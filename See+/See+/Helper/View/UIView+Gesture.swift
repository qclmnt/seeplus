//
//  UIView+Gesture.swift
//  See+
//
//  Created by Quentin CLEMENT on 09/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Tap Gesture
    
    func createTapGesture(target: Any, selector: Selector) {
        self.createTapGesture(target: target,
                              selector: selector,
                              delegate: nil)
    }
    
    func createTapGesture(target: Any, selector: Selector, delegate: UIGestureRecognizerDelegate?) {
        self.removeGestureRecognizers()
        self.isUserInteractionEnabled = true
        
        let gr = UITapGestureRecognizer(target: target, action: selector)
        gr.delegate = delegate
        self.addGestureRecognizer(gr)
    }
    
    // MARK: - End Editing gesture
    
    func addEndEditingTapGesture(delegate: UIGestureRecognizerDelegate?) {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(endEditingAction(tapGesture:)))
        
        tapGestureRecognizer.delegate = delegate
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func addEndEditingSwipeDownGesture(delegate: UIGestureRecognizerDelegate?) {
        
        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self,
                                                                  action: #selector(endEditingAction(tapGesture:)))
        
        swipeDownGestureRecognizer.direction = .down
        swipeDownGestureRecognizer.delegate = delegate
        self.addGestureRecognizer(swipeDownGestureRecognizer)
    }
    
    // MARK: - End Editing gesture action
    
    @objc func endEditingAction(tapGesture: UITapGestureRecognizer) {
        AppDelegate.shared()?.window??.endEditing(true)
    }
    
    // MARK: - Remove Gesture
    
    func removeGestureRecognizers() {
        guard let gestureRecognizers = self.gestureRecognizers else {return}
        for gr in gestureRecognizers {
            self.removeGestureRecognizer(gr)
        }
    }
}

