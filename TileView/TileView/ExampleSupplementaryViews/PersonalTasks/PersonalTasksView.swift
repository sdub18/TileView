//
//  PersonalTasksViewController.swift
//  harts-ios-coaches
//
//  Created by Sam DuBois on 7/15/19.
//  Copyright © 2019 Center for Youth Engagement. All rights reserved.
//

import UIKit

class PersonalTasksView: UIView, UITableViewDelegate, UITableViewDataSource, TileViewSourceDelegate {
    
    // TESTING PURPOSES ONLY
    let tasks = { () -> [PersonalTask] in
        let tasks: [PersonalTask] = [
        PersonalTask(task: "Check up on client who required assistance last check up", dueDate: "TUE 7/19", attachments: nil),
        PersonalTask(task: "Remind Patient 15 to take medication", dueDate: "WED 7/20", attachments: nil),
        PersonalTask(task: "Get to Meeting and run presentation on delivery", dueDate: "THURS 7/21", attachments: nil),
        PersonalTask(task: "Talk to Jonathan about new job promotion", dueDate: "SAT 7/23", attachments: nil),
        ]
        return tasks
    }()
    
    
    let tableView = { () -> UITableView in
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.rowHeight = 100
        tableView.sectionHeaderHeight = 100
        
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonalTasksViewCell.self, forCellReuseIdentifier: "PersonalTasksCell")
        tableView.register(PersonalTasksDetailsCell.self, forCellReuseIdentifier: "PersonalTasksDetailsCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        switch task.cellType {
        case .collapsed:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTasksCell", for: indexPath) as! PersonalTasksViewCell
            
            // Define Cell Properties
            cell.dueDateLabel.text = task.dueDate
            cell.taskLabel.text = task.task
            cell.selectionStyle = .none
            
            // TEST DATA
            switch indexPath.row {
            case 0:
                cell.statusView.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
            case 1:
                cell.statusView.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
            case 2:
                cell.statusView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            case 3:
                cell.statusView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            default:
                break
            }
            
            return cell
        case .expanded:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTasksDetailsCell", for: indexPath) as! PersonalTasksDetailsCell
            
            // Define Cell Properties
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    // Delegagtes to handle Tile View Expansion and Closure
    func tileViewObjectdidExpand(_ tileViewObject: TileView) {
        
    }
    
    func tileViewObjectdidClose(_ tileViewObject: TileView) {
        
    }
    
    func constrainForPreview(_ tileViewObject: TileView) {
        
    }
    
    func constrainForFullScreen(_ tileViewobject: TileView) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
