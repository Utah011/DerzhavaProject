//
//  SearchScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 15.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class SearchScreenView: UIView {
    
    let tableview = UITableView()
    var const = NSLayoutConstraint()

    
    enum Constants {
        static let segmentedControlHeight: CGFloat = 40
        static let underlineViewColor: UIColor = Colors.darkBlue ?? UIColor.red
        static let underlineViewHeight: CGFloat = 2
    }

    // Container view of the segmented control
    lazy var segmentedControlContainerView = UIView()
    
    // Customised segmented control
    lazy var segmentedControl = UISegmentedControl()

    // The underline view below the segmented control
    lazy var bottomUnderlineView = UIView()

    lazy var leadingDistanceConstraint: NSLayoutConstraint = {
        return bottomUnderlineView.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .singleLine
        addSubview(tableview)


        // Container view of the segmented control

        segmentedControlContainerView.backgroundColor = Colors.background
        segmentedControlContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentedControlContainerView)

        
        // Customised segmented control

            // Remove background and divider colors
            segmentedControl.backgroundColor = .clear
            segmentedControl.tintColor = .clear

            // Append segments
            segmentedControl.insertSegment(withTitle: "Общее", at: 0, animated: true)
            segmentedControl.insertSegment(withTitle: "Авторы", at: 1, animated: true)
            segmentedControl.insertSegment(withTitle: "Дебаты", at: 2, animated: true)
            segmentedControl.insertSegment(withTitle: "Новости", at: 3, animated: true)

            // Select first segment by default
            segmentedControl.selectedSegmentIndex = 0

            // Change text color and the font of the NOT selected (normal) segment
            segmentedControl.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1),
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)], for: .normal)

            // Change text color and the font of the selected segment
            segmentedControl.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: Constants.underlineViewColor,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)

            // Set up event handler to get notified when the selected segment changes
//            segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)

            // Return false because we will set the constraints with Auto Layout
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlContainerView.addSubview(segmentedControl)


        // The underline view below the segmented control

        bottomUnderlineView.backgroundColor = Constants.underlineViewColor
        bottomUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlContainerView.addSubview(bottomUnderlineView)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let constr = segmentedControlContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0)
        constr.isActive = true
        segmentedControlContainerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        segmentedControlContainerView.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight).isActive = true
        
        tableview.topAnchor.constraint(equalTo: segmentedControlContainerView.bottomAnchor, constant: 0).isActive = true
        tableview.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}
