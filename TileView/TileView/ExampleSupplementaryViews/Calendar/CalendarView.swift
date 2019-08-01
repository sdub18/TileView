//
//  CalendarView.swift
//  harts-ios-coaches
//
//  Created by Sam DuBois on 7/18/19.
//  Copyright © 2019 Center for Youth Engagement. All rights reserved.
//

import UIKit

class CalendarView: UIView, TileViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let calendarCollectionView: UICollectionView = { () -> UICollectionView in
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(calendarCollectionView)
        
        NSLayoutConstraint.activate([
            
            calendarCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            calendarCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            calendarCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            calendarCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        
        // For Testing Purposes Only
        cell.dateLabel.text = "\(indexPath.row + 1)"
        
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        
        if indexPath.row + 1 == day {
            cell.dateLabel.textColor = .white
            cell.currentDayView.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
        }
        
        switch indexPath.row + 1 {
        case 1:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
        case 4:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
        case 10:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
        case 13:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
        case 15:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
        case 16:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 1, green: 0.007428591602, blue: 0.2827850753, alpha: 1)
        case day:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        case 22:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case 24:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case 26:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case 31:
            cell.statusIcon.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        default:
            break
        }
        
        // END TESTING DATA
        
        return cell
    }
    
    func tileViewObjectdidExpand(_ tileViewObject: TileView) {
        
    }
    
    func tileViewObjectdidClose(_ tileViewObject: TileView) {
        
    }
    
    func constrainForPreview(_ tileViewObject: TileView) {
        
    }
    
    func constrainForFullScreen(_ tileViewobject: TileView) {
        
    }
    
    
    
}

extension CalendarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 45, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
