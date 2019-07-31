//
//  CalendarCell.swift
//  harts-ios-coaches
//
//  Created by Sam DuBois on 7/18/19.
//  Copyright © 2019 Center for Youth Engagement. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    let dateLabel = { () -> UILabel in
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    let currentDayView = { () -> UIView in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    // Alerts User whether or not they have a task on the specified date
    let statusIcon = { () -> UIView in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.addSubview(currentDayView)
        self.addSubview(dateLabel)
        self.addSubview(statusIcon)
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        constrainForCompactTile()
    }
    
    // MARK: Constrain Tile View Content For Different Sizes
    
    /* Constrain View for Diverse and Changing Tile Sizes
                         ___________
                       /           /
     Same     ---->   /  Compact  /  <-- Most Orientation Settinsg
     Height /        /___________/
     ----/     _______________________
     /       /                       /
     ---->  /     REGULAR SIZE      /    <--  Certain Landscape Settings (Larger Width)
           /_______________________/
       _______________________
     /                       /
     /                       /
     /     FULL SCREEN       /   <--  View When expanded (Larger Height and Width)
     /                       /
     /                       /
     /_______________________/
     
     */
    
    func constrainForCompactTile() {
        // Deactivate Previous Constraints and Instantiate New Ones
        NSLayoutConstraint.activate([
            
                dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
                dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
                dateLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
                dateLabel.heightAnchor.constraint(equalToConstant: 40),
                
                currentDayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
                currentDayView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2.5),
                currentDayView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2.5),
                currentDayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13),
                
                statusIcon.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
                statusIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                statusIcon.widthAnchor.constraint(equalToConstant: 10),
                statusIcon.heightAnchor.constraint(equalToConstant: 10)
            
            ])
    }
    
    func constrainForRegularTile() {
        // Constrain for Regular Size
    }
    
    func constrainForFullScreen() {
        // Constrain for Full Screen Size
    }
}
