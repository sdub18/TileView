//
//  TileView.swift
//  TileView
//
//  Created by Sam DuBois on 7/23/19.
//  Copyright © 2019 SamDuBois. All rights reserved.
//

import UIKit

class TileView: UIView, TileViewSource {
    
    // MARK: Model Attributes
    var touchGesture = UILongPressGestureRecognizer()
    var pinchGesture = UIPinchGestureRecognizer()
    var dataSource: TileViewDataSource?
    var delegate: TileViewSourceDelegate?
    var title: String = "Default Title"
    var mainColor: UIColor
    var isActive: Bool
    var type: TileType
    
    // Original constraints for TileView in preview size (Compact or Regular)
    var previewConstraints = [NSLayoutConstraint]()
    
    // Full screen constraints accessed when the view is expanded
    lazy var fullScreenConstraints = [
        self.topAnchor.constraint(equalTo: superview!.superview!.superview!.topAnchor),
        self.bottomAnchor.constraint(equalTo: superview!.superview!.superview!.bottomAnchor),
        self.leftAnchor.constraint(equalTo: superview!.superview!.superview!.leftAnchor),
        self.rightAnchor.constraint(equalTo: superview!.superview!.superview!.rightAnchor)
    ]
    
    // CORNER RADIUS FOR TILE VIEW OBJECT
    let CORNER_RADIUS = CGFloat(20)
    
    // MARK: Model Subviews
    var titleView: UIView = UIView()
    var titleViewHeightConstraint: NSLayoutConstraint?
    
    let titleLabel = { () -> UILabel in
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title1).pointSize, weight: .heavy)
        label.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let closeButton = { () -> UIButton in
        let button = UIButton()
        button.addTarget(self, action: #selector(closeButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "CloseGlyph"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.layer.cornerRadius = 20
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7495451627)
        button.layer.isHidden = true
        
        return button
    }()
    
    let contentView = { () -> UIView in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return view
    }()
    
    // MARK: Initialization
    
    // Generic Initialization with generic constraints to satisfy variables
    override init(frame: CGRect) {
        self.isActive = true
        self.type = .unspecified
        self.mainColor = .gray
        super.init(frame: frame)
        
        // Set up object appearance
        self.layer.cornerRadius = CORNER_RADIUS
        self.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
        self.isUserInteractionEnabled = true
        self.layer.addShadow()
        setupSubviews()
    }
    
    convenience init(ofType: TileType, withTitle: String, primaryTitleColor: UIColor, secondaryTitleColor: UIColor) {
        self.init()
        self.title = withTitle
        self.isActive = true
        self.type = ofType
        self.mainColor = primaryTitleColor
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup and Add Subviews
    func setupSubviews() {
        
        // Create Title View to House Main Title and Close Button
        titleView.clipsToBounds = true
        titleView.backgroundColor = mainColor
        titleView.layer.cornerRadius = 20
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Setup Touch Gesture Recognizer
        self.touchGesture = UILongPressGestureRecognizer(target: self, action: #selector(touchesMade(sender:)))
        self.touchGesture.minimumPressDuration = 0
        titleView.addGestureRecognizer(touchGesture)
        
        // Setup Swipe Gesture Recognizer
        self.pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchesMade(sender:)))
        self.addGestureRecognizer(pinchGesture)
        self.pinchGesture.isEnabled = false
        
        // Set title of TitleLabel
        titleLabel.text = self.title
        
        // Set color of Close Button
        closeButton.imageView?.tintColor = mainColor
        
        // Add Subviews
        self.addSubview(titleView)
        titleView.addSubview(titleLabel)
        self.addSubview(contentView)
        self.addSubview(closeButton)
        
        // TODO: This sets the max height for the titleView constraint. Should be fixed in the future
        titleViewHeightConstraint = titleView.heightAnchor.constraint(equalToConstant: 50)
    }
    
    override func layoutSubviews() {
        // Constrain TitleView and Subviews
        NSLayoutConstraint.activate([
            
            // Title View
            titleView.topAnchor.constraint(equalTo: self.topAnchor),
            titleView.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleView.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleViewHeightConstraint!, // This Controls height of titleView as the view is expanded and contracted (HartsAnimations.Swift)
            
            // Title Label
            titleLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -10),
            
            // Close Button
            closeButton.rightAnchor.constraint(equalTo: titleView.rightAnchor, constant: -20),
            closeButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            
            // Content View
            contentView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
            ])
    }
    
    // MARK: Handle Selector Functions
    
    // Handle UIGestureRecognizer Function
    @objc func touchesMade(sender : UILongPressGestureRecognizer) {
        if sender.state == .began {
            self.squish(forDuration: 0.2, fromVal: 1, toVal: 0.95)
        } else if sender.state == .ended {
            touchGesture.isEnabled = false
            pinchGesture.isEnabled = true
            self.delegate?.tileViewObjectDidExpand(self)
            titleLabel.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize, weight: .heavy)
        }
    }
    
    // Two Finger Gesture Recognizer to quickly close TileView Object
    @objc func pinchesMade(sender : UIPinchGestureRecognizer) {
        if sender.state == .began {
            closeButtonPressed(sender)
        }
    }
    
    // Handle Closed Button Sender Function
    @objc func closeButtonPressed(_ sender : AnyObject) {
        touchGesture.isEnabled = true
        pinchGesture.isEnabled = false
        titleLabel.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title1).pointSize, weight: .heavy)
        self.delegate?.tileViewObjectDidClose(self)
    }
    
}
