//
//  TileViewAnimations.swift
//  TileView
//
//  Created by Sam DuBois on 7/23/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//

import UIKit

// MARK: UIView Animations
extension UIView {
    
    func squish(forDuration: Double, fromVal: Double, toVal: Double) {
        let squish = CABasicAnimation(keyPath: "transform.scale")
        
        squish.duration = forDuration
        squish.fromValue = fromVal
        squish.toValue = toVal
        squish.fillMode = CAMediaTimingFillMode.forwards
        squish.isRemovedOnCompletion = false
        
        layer.add(squish, forKey: nil)
    }
    
    func squish(forDuration: Double, fromVal: Double, toVal: Double, completionHandler: (_ complete: Bool) -> Void) {
        let squish = CABasicAnimation(keyPath: "transform.scale")
        
        squish.duration = forDuration
        squish.fromValue = fromVal
        squish.toValue = toVal
        squish.fillMode = CAMediaTimingFillMode.forwards
        squish.isRemovedOnCompletion = false
        
        layer.add(squish, forKey: nil)
        
        completionHandler(true)
    }
    
    func pull(forDuration: Double, fromVal: Double, toVal: Double) {
        
        let pull = CABasicAnimation(keyPath: "transform.scale")
        
        pull.duration = 0.3
        pull.fromValue = 0.95
        pull.toValue = 1
        pull.fillMode = CAMediaTimingFillMode.forwards
        pull.isRemovedOnCompletion = false
        
        layer.add(pull, forKey: nil)
    }
    
    func pull(forDuration: Double, fromVal: Double, toVal: Double, completionHandler: (_ complete: Bool) -> Void) {
        
        let pull = CABasicAnimation(keyPath: "transform.scale")
        
        pull.duration = 0.3
        pull.fromValue = 0.95
        pull.toValue = 1
        pull.fillMode = CAMediaTimingFillMode.forwards
        pull.isRemovedOnCompletion = false
        
        layer.add(pull, forKey: nil)
        
        completionHandler(true)
    }
}

// MARK: Tile View Animations
extension TileView {
    
    func contract() {
        
        if !previewConstraints.isEmpty {
            
            for constraint in fullScreenConstraints {
                constraint.isActive = false
            }
            
            for constraint in previewConstraints {
                constraint.isActive = true
            }
        }
        
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            
            self.layer.cornerRadius = 20
            self.subviews.forEach({ $0.layer.cornerRadius = 20 })
            self.titleViewHeightConstraint?.constant = 50
            self.closeButton.isHidden = true
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
            self.layer.revealShadow()
            self.titleLabel.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    func expand() {
        
        if !previewConstraints.isEmpty {
            
            for constraint in fullScreenConstraints {
                constraint.isActive = true
            }
            
            for constraint in previewConstraints {
                constraint.isActive = false
            }
        }
        
        self.pull(forDuration: 0.3, fromVal: 0.95, toVal: 1)
        
        UIView.animate(withDuration: 0.3) {
            
            self.layer.cornerRadius = 0
            self.closeButton.isHidden = false
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
            self.layer.hideShadow()
            self.titleViewHeightConstraint?.constant = 127
            self.titleLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            self.subviews.forEach({
                if $0 != self.closeButton {
                    $0.layer.cornerRadius = 0
                }
            })
        }
    }
}
