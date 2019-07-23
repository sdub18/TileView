//
//  CALayer+Shadows.swift
//  TileView
//
//  Created by Sam DuBois on 7/23/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//

import UIKit

extension CALayer {
    func addShadow() {
        self.shadowOffset = .zero
        self.shadowOpacity = 0.2
        self.shadowRadius = 15
        self.shadowColor = UIColor.black.cgColor
        self.masksToBounds = false
    }
    
    func hideShadow() {
        shadowOpacity = 0
    }
    
    func revealShadow() {
        shadowOpacity = 0.2
    }
}
