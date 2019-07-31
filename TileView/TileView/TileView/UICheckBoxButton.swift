//
//  CheckBoxButton.swift
//  TileView
//
//  Created by Sam DuBois on 7/24/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//
import UIKit

class UICheckBoxButton: UIButton {
    
    lazy var completionView = UIView()
    var completionState: checkBoxState = .incomplete
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        completionView.translatesAutoresizingMaskIntoConstraints = false
        completionView.isUserInteractionEnabled = false
        self.addSubview(completionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 3
        self.addConstrainedSubview(completionView, top: 7, right: 7, bottom: 7, left: 7)
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        completionView.layer.cornerRadius = completionView.frame.width / 2
    }
    
}

enum checkBoxState {
    case complete
    case incomplete
}



