//
//  PersonalTasksViewCell.swift
//  harts-ios-coaches
//
//  Created by Sam DuBois on 7/15/19.
//  Copyright © 2019 Center for Youth Engagement. All rights reserved.
//

import UIKit

class PersonalTasksViewCell: UITableViewCell {
    
    let checkBoxButton = { () -> UICheckBoxButton in
        let checkBox = UICheckBoxButton()
        checkBox.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        checkBox.completionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()
    
    let taskLabel = { () -> UILabel in
        let label = UILabel()
        label.text = "This is some test text to ensure view is correctly displaying information"
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: .medium)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusView = { () -> UIView in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
        return view
    }()
    
    let dueDateLabel = { () -> UILabel in
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dueTimeLabel = { () -> UILabel in
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func didMoveToSuperview() {
        // Add Target to CheckBox Button
        checkBoxButton.addTarget(self, action: #selector(checkBoxChanged), for: .touchUpInside)
        
        // Add Subviews
        self.contentView.addSubview(checkBoxButton)
        self.addSubview(statusView)
        self.addSubview(taskLabel)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        constrainForCompactTile()
    }
    
    // MARK: Constrain Tile View Content For Different Sizes
    
    /* Constrain View for Diverse and Changing Tile Sizes
                    ___________
                  /           /
Same    ---->    /  Compact  /  <-- Most Orientation Settinsg
Height /        /___________/
  ----/        _______________________
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
        self.constraints.deActivate()
        NSLayoutConstraint.activate([
            
            // Check Box Button
            checkBoxButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            checkBoxButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkBoxButton.widthAnchor.constraint(equalToConstant: 35),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 35),
            
            // Status View
            statusView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            statusView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            statusView.widthAnchor.constraint(equalToConstant: 20),
            statusView.heightAnchor.constraint(equalToConstant: 20),
            
            // Task Label
            taskLabel.leftAnchor.constraint(equalTo: checkBoxButton.rightAnchor, constant: 10),
            taskLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            taskLabel.rightAnchor.constraint(equalTo: statusView.leftAnchor, constant: -10)
            
            
        ])
    }
    
    func constrainForRegularTile() {
        // Constrain for Regular Size
    }
    
    func constrainForFullScreen() {
        // Constrain for Full Screen Size
    }
    
    @objc func checkBoxChanged() {
        switch self.checkBoxButton.completionState {
        case .complete:
            self.checkBoxButton.completionState = .incomplete
            // Change UI Appearance
            self.checkBoxButton.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            self.checkBoxButton.completionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            
            // Update Database
            
            break
        case .incomplete:
            self.checkBoxButton.completionState = .complete
            // Change UI Appearance
            self.checkBoxButton.layer.borderColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
            self.checkBoxButton.completionView.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
            
            // Update Database
            
            break
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            
        }
    }
    
}
