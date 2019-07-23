//
//  TileViewSource.swift
//  TileView
//
//  Created by Sam DuBois on 7/23/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//

import Foundation

enum TileType {
    case pendingClients
    case callCheckUps
    case calendar
    case personalTasks
    case activity
    case unspecified
}

// MARK: Delegate Methods for responding to actions made on the Tile View Object
protocol TileViewSourceDelegate: class {
    
    func tileViewObjectdidExpand(_ tileViewObject: TileView)
    
    func tileViewObjectdidClose(_ tileViewObject: TileView)
    
    // MARK: Constrain Tile View Content For Different Sizes
    
    /* Constrain View for Diverse and Changing Tile Sizes
                         ___________
                       /           /
     Preview  --->    /  Compact  /  <-- Most Orientation Settings
     Views  /        /___________/
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
     
     LOOK AT REPOSITORY WIKI TO LEARN MORE
     
     */
    
    func constrainForPreview(_ tileViewObject: TileView)
    
    func constrainForFullScreen(_ tileViewobject: TileView)
    
}

protocol TileViewSource: class {
    
    var delegate: TileViewSourceDelegate? { get set }
    
    var isActive: Bool { get set }
}

