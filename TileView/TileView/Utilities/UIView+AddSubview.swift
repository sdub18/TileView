//
//  UIView+AddSubview.swift
//  TileView
//
//  Created by Sam DuBois on 7/23/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstrainedSubview(_ childView: UIView, top: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0, left: CGFloat = 0) {
        self.addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: self.topAnchor, constant: top),
            childView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -right),
            childView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottom),
            childView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: left),
            ])
    }
    
    func addSubview(_ view: UIView?) {
        guard let viewToAdd = view else { return }
        self.addSubview(viewToAdd)
    }
    
}
