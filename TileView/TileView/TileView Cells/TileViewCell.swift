//
//  CollectionViewCell.swift
//  TileView
//
//  Created by Sam DuBois on 7/24/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//

import UIKit

class TileViewCell: UICollectionViewCell {
    
    var tileView: TileView = TileView()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.addSubview(tileView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            tileView.topAnchor.constraint(equalTo: self.topAnchor),
            tileView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tileView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tileView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
            ])
    }
    
}
