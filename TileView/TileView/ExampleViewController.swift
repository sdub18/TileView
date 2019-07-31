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
    
    // Main Tile Views
    let personalTasks = { () -> TileView in
        
        let tileView = TileView(ofType: .personalTasks, withTitle: "Personal Activity", primaryTitleColor: Colors.PERSONAL_TASKS_PRIMARY_COLOR, secondaryTitleColor: Colors.PERSONAL_TASKS_SECONDARY_COLOR)
        tileView.translatesAutoresizingMaskIntoConstraints = false
        let personalTasksView = PersonalTasksView()
        tileView.contentView.addConstrainedSubview(personalTasksView, top: 0, right: 0, bottom: 0, left: 0)
        tileView.dataSource = personalTasksView
        
        return tileView
    }()
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self

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
        collectionView.isScrollEnabled = false
        
        collectionView.performBatchUpdates({
            selectedCell = tileViewObject.tag
            tileViewObject.expand()
        }, completion: nil)
    
    }
    
    func tileViewObjectDidClose(_ tileViewObject: TileView) {
        collectionView.isScrollEnabled = true
        
        collectionView.performBatchUpdates({
            selectedCell = -1
            tileViewObject.contract()
        }, completion: nil)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TileViewCell", for: indexPath) as! TileViewCell
        cell.tileView.tag = indexPath.row
        cell.tileView.delegate = self
        
        
        
        
        
        cell.tileView = personalTasks
        return cell
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        // Call New Constraints AFTER the main view has been appropriately resized
        coordinator.animate(alongsideTransition: nil) { (_) in
            
        }
    }
    
}

extension ExampleViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == selectedCell {
            return CGSize(width: view.frame.width, height: view.frame.height)
        } else {
            return CGSize(width: view.frame.width / 2 - 50, height: view.frame.height / 2)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == selectedCell {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == selectedCell {
            return 0
        } else {
            return 10
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == selectedCell {
            return 0
        } else {
            return 10
        }
    }
}

