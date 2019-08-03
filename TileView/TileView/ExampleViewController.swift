//
//  ViewController.swift
//  TileView
//
//  Created by Sam DuBois on 7/23/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController, TileViewSourceDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Currently Selected Cell
    var selectedCell = -1
    
    // MARK: Define Subviews
    
    // Collection View
    let collectionView: UICollectionView = { () -> UICollectionView in
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(TileViewCell.self, forCellWithReuseIdentifier: "TileViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // Current Content Offset of collection View
    var contentOffset: CGPoint = CGPoint.zero
    
    var tileViewArray : [TileView] = [
    
        // Calendar
        { () -> TileView in

            let tileView = TileView(ofType: .calendar, withTitle: "Calendar", primaryTitleColor: Colors.CALENDAR_PRIMARY_COLOR, sizeClass: .previewCompact)
            tileView.translatesAutoresizingMaskIntoConstraints = false
            let calendarView = CalendarView()
            tileView.contentView.addConstrainedSubview(calendarView, top: 0, right: 0, bottom: 0, left: 0)
            tileView.dataSource = calendarView
            tileView.tag = 0

            return tileView
        }() ,
        
        // Personal Tasks
        { () -> TileView in
            
            let tileView = TileView(ofType: .personalTasks, withTitle: "Tasks", primaryTitleColor: Colors.PERSONAL_TASKS_PRIMARY_COLOR, sizeClass: .previewRegular)
            tileView.translatesAutoresizingMaskIntoConstraints = false
            let personalTasksView = PersonalTasksView()
            tileView.contentView.addConstrainedSubview(personalTasksView, top: 0, right: 0, bottom: 0, left: 0)
            tileView.dataSource = personalTasksView
            tileView.tag = 1
            
            return tileView
        }() ,
        
        { () -> TileView in

            let tileView = TileView(ofType: .personalTasks, withTitle: "Tasks", primaryTitleColor: Colors.PERSONAL_TASKS_PRIMARY_COLOR, sizeClass: .previewRegular)
            tileView.translatesAutoresizingMaskIntoConstraints = false
            let personalTasksView = PersonalTasksView()
            tileView.contentView.addConstrainedSubview(personalTasksView, top: 0, right: 0, bottom: 0, left: 0)
            tileView.dataSource = personalTasksView
            tileView.tag = 2

            return tileView
        }() ,
        
        // Calendar
        { () -> TileView in

            let tileView = TileView(ofType: .calendar, withTitle: "Calendar", primaryTitleColor: Colors.CALENDAR_PRIMARY_COLOR, sizeClass: .previewCompact)
            tileView.translatesAutoresizingMaskIntoConstraints = false
            let calendarView = CalendarView()
            tileView.contentView.addConstrainedSubview(calendarView, top: 0, right: 0, bottom: 0, left: 0)
            tileView.dataSource = calendarView
            tileView.tag = 3

            return tileView
        }() ,
        
        { () -> TileView in

            let tileView = TileView(ofType: .personalTasks, withTitle: "Tasks", primaryTitleColor: Colors.PERSONAL_TASKS_PRIMARY_COLOR, sizeClass: .previewCompact)
            tileView.translatesAutoresizingMaskIntoConstraints = false
            let personalTasksView = PersonalTasksView()
            tileView.contentView.addConstrainedSubview(personalTasksView, top: 0, right: 0, bottom: 0, left: 0)
            tileView.dataSource = personalTasksView
            tileView.tag = 4

            return tileView
        }() ,
        
        { () -> TileView in

            let tileView = TileView(ofType: .personalTasks, withTitle: "Tasks", primaryTitleColor: Colors.PERSONAL_TASKS_PRIMARY_COLOR, sizeClass: .previewCompact)
            tileView.translatesAutoresizingMaskIntoConstraints = false
            let personalTasksView = PersonalTasksView()
            tileView.contentView.addConstrainedSubview(personalTasksView, top: 0, right: 0, bottom: 0, left: 0)
            tileView.dataSource = personalTasksView
            tileView.tag = 5

            return tileView
        }() ,
        
        { () -> TileView in

            let tileView = TileView(ofType: .personalTasks, withTitle: "Tasks", primaryTitleColor: Colors.PERSONAL_TASKS_PRIMARY_COLOR, sizeClass: .previewCompact)
            tileView.translatesAutoresizingMaskIntoConstraints = false
            let personalTasksView = PersonalTasksView()
            tileView.contentView.addConstrainedSubview(personalTasksView, top: 0, right: 0, bottom: 0, left: 0)
            tileView.dataSource = personalTasksView
            tileView.tag = 6

            return tileView
        }() ,
    
    
    ]
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var counter = 0
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        for tileView in tileViewArray {
            tileView.delegate = self
            tileView.tag = counter
            counter += 1
        }

    }
    
    override func viewWillLayoutSubviews() {
        collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

            ])
        
    }
    
    // MARK: Handle Delegatation
    func tileViewObjectDidExpand(_ tileViewObject: TileView) {
//        collectionView.isScrollEnabled = false
        view.bringSubviewToFront(tileViewObject)
        
        collectionView.performBatchUpdates({
            
//             tileViewArray.remove(at: tileViewObject.tag)
//             tileViewArray.insert(tileViewObject, at: 0)
            
            selectedCell = tileViewObject.tag
            
//             collectionView.moveItem(at: IndexPath(item: tileViewObject.tag, section: 0), to: IndexPath(item: 0, section: 0))
            
            contentOffset = collectionView.contentOffset
            
//            collectionView.setContentOffset(CGPoint.zero, animated: true)
            collectionView.layoutIfNeeded()
            
            tileViewObject.expand()
        }, completion: nil)
    }
    
    func tileViewObjectDidClose(_ tileViewObject: TileView) {
        collectionView.isScrollEnabled = true
        
        collectionView.performBatchUpdates({
            
            selectedCell = -1
            
//             tileViewArray.remove(at: 0)
//             tileViewArray.insert(tileViewObject, at: tileViewObject.tag)

//              collectionView.moveItem(at: IndexPath(item: 0, section: 0), to: IndexPath(item: tileViewObject.tag, section: 0))

            tileViewObject.contract()
            collectionView.setContentOffset(contentOffset, animated: true)

        }, completion: nil)
    }
    
    // MARK: Handle Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tileViewArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TileViewCell", for: indexPath) as! TileViewCell
        
        cell.tileView = tileViewArray[indexPath.row]
        
        cell.addSubview(cell.tileView)
        
        NSLayoutConstraint.activate([
        
            (cell.tileView!.topAnchor.constraint(equalTo: cell.topAnchor)),
            (cell.tileView!.leftAnchor.constraint(equalTo: cell.leftAnchor)),
            (cell.tileView!.rightAnchor.constraint(equalTo: cell.rightAnchor)),
            (cell.tileView!.bottomAnchor.constraint(equalTo: cell.bottomAnchor))
        
        ])
        
        return cell
    }
    
}

extension ExampleViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if tileViewArray[indexPath.row].tag == selectedCell {
            return CGSize(width: view.frame.width, height: view.frame.height)
        } else {
            switch tileViewArray[indexPath.row].sizeClass {
            case .fullScreen:
                return CGSize(width: view.frame.width, height: view.frame.height)
            case .previewCompact:
                return CGSize(width: view.frame.width / 4, height: 450)
            case .previewRegular:
                return CGSize(width: view.frame.width * 2 / 3, height: 450)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == selectedCell {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == selectedCell {
            return 0
        } else {
            return 20
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == selectedCell {
            return 0
        } else {
            return 20
        }
    }
    
    
}

