//
//  ViewController.swift
//  TileView
//
//  Created by Sam DuBois on 7/23/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, TileViewSourceDelegate, UIScrollViewDelegate {
    
    // State Variables for sizing
    var splitViewState: UISplitViewController.DisplayMode = .allVisible
    var PADDING: CGFloat = 20
    
    // MARK: Define Subviews
    
    // Collection View
    let collectionView: UICollectionView = { () -> UICollectionView in
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // Main Tile Views
    let personalTasks = { () -> TileView in
        
        let tileView = TileView(ofType: .personalTasks, withTitle: "Personal Activity", primaryTitleColor: Colors.PERSONAL_TASKS_PRIMARY_COLOR, secondaryTitleColor: Colors.PERSONAL_TASKS_SECONDARY_COLOR)
        tileView.translatesAutoresizingMaskIntoConstraints = false
        let personalTasksView = PersonalTasksView()
        tileView.contentView.addConstrainedSubview(personalTasksView, top: 0, right: 0, bottom: 0, left: 0)
        tileView.delegate = personalTasksView
        
        return tileView
    }()
    
    let activity = { () -> TileView in
        
        let tileView = TileView(ofType: .activity, withTitle: "Activities", primaryTitleColor: Colors.ACTIVITY_PRIMARY_COLOR, secondaryTitleColor: Colors.ACTIVITY_SECONDARY_COLOR)
        tileView.translatesAutoresizingMaskIntoConstraints = false
        
        return tileView
    }()
    
    let calendar = { () -> TileView in
        
        let tileView = TileView(ofType: .calendar, withTitle: "Calendar", primaryTitleColor: Colors.CALENDAR_PRIMARY_COLOR, secondaryTitleColor: Colors.CALENDAR_SECONDARY_COLOR)
        tileView.translatesAutoresizingMaskIntoConstraints = false
        let calendarView = CalendarView()
        tileView.contentView.addConstrainedSubview(calendarView, top: 0, right: 0, bottom: 0, left: 0)
        tileView.delegate = calendarView
        
        return tileView
    }()
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        self.navigationController?.isNavigationBarHidden = true
        
        // Define Delegates
        activity.delegate = self

    }
    
    // MARK: Handle Delegatation
    
    func tileViewObjectdidExpand(_ tileViewObject: TileView) {
        
    }
    
    func tileViewObjectdidClose(_ tileViewObject: TileView) {
        
    }
    
    func constrainForPreview(_ tileViewObject: TileView) {
        
    }
    
    func constrainForFullScreen(_ tileViewobject: TileView) {
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        // Call New Constraints AFTER the main view has been appropriately resized
        coordinator.animate(alongsideTransition: nil) { (_) in
            
        }
    }
    
}

