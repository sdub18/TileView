//
//  PersonalTasks.swift
//  harts-ios
//
//  Created by Sam DuBois on 7/17/19.
//  Copyright © 2019 Center for Youth Engagement. All rights reserved.
//

import Foundation

// MARK: Model For Handling Personal Task Data
class PersonalTask {
    
    private(set) public var task: String
    private(set) public var cellType: PersonalTasksCellType = .collapsed
    private(set) public var dueDate: String
    public var attachments: [Any]
    public var isCompleted: Bool = false
    public let creationDate: String
    
    init(task: String, dueDate: String, attachments: [Any]?) {
        self.task = task
        self.dueDate = dueDate
        self.attachments = attachments ?? [Any]()
        
        // Attach Creation Date
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        creationDate = dateFormatter.string(from: date)
    }
    
    convenience init(task: String, dueDate: String, attachments: [Any]?, cellType: PersonalTasksCellType) {
        self.init(task: task, dueDate: dueDate, attachments: attachments)
        self.cellType = cellType
    }
    
    func editTask(_ task: String) {
        self.task = task
    }
    
    func changeDueDate(_ dueDate: String) {
        self.dueDate = dueDate
    }
    
}

enum PersonalTasksCellType {
    case collapsed
    case expanded
}
