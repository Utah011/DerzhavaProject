//
//  FullInformationAboutUserScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 15.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class FullInformationAboutUserScreenView: UIView {
    
    enum Constants {
        static let segmentedControlHeight: CGFloat = 40
        static let underlineViewColor: UIColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
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
    
//    let justview = UIView()
    let tableview = UITableView()
//    let topView = UIView()
    let logoImageView = UIImageView()
    let veryficationButton = UIButton()
    var statement = false
    var checkMarkSelected = 0
    let nameLabel = UILabel()
    let positionLabel = UILabel()
    let myViewHeader = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        tableview.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        addSubview(tableview)

        // Container view of the segmented control

        segmentedControlContainerView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        segmentedControlContainerView.translatesAutoresizingMaskIntoConstraints = false
        myViewHeader.addSubview(segmentedControlContainerView)
        
        // Customised segmented control


            // Remove background and divider colors
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear

            // Append segments
        segmentedControl.insertSegment(withTitle: "Новости", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Позиция", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Дебаты", at: 2, animated: true)
        
        if flag != 1 {
            segmentedControl.removeSegment(at: 2, animated: true)
        }

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

            // Return false because we will set the constraints with Auto Layout
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlContainerView.addSubview(segmentedControl)



        // The underline view below the segmented control

        bottomUnderlineView.backgroundColor = Constants.underlineViewColor
        bottomUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlContainerView.addSubview(bottomUnderlineView)


//        justview.translatesAutoresizingMaskIntoConstraints = false
//        justview.backgroundColor = .systemBlue
//
//        topView.translatesAutoresizingMaskIntoConstraints = false
//        topView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.masksToBounds = true
        logoImageView.clipsToBounds = true
        if flag == 1 {
            logoImageView.image = UIImage(named: "polit")
        } else {
            logoImageView.image = UIImage(named: "riabiglogo")
        }
            
        logoImageView.layer.cornerRadius = 50
        logoImageView.contentMode = .scaleAspectFill
        myViewHeader.addSubview(logoImageView)


        veryficationButton.translatesAutoresizingMaskIntoConstraints = false
        veryficationButton.layer.masksToBounds = true
        veryficationButton.setImage(UIImage(named: "addfollowlogo"), for: .normal)
        myViewHeader.addSubview(veryficationButton)

        nameLabel.numberOfLines = 1
        if flag == 1 {
            nameLabel.text = "Денис Мантуров"
        } else {
            nameLabel.text = "РИА"
            
        }
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        nameLabel.textColor = .black
        nameLabel.lineBreakMode = .byTruncatingTail
        myViewHeader.addSubview(nameLabel)

        positionLabel.numberOfLines = 2
        positionLabel.textAlignment = .center
        if flag == 1 {
            positionLabel.text = "Министр промышленности и торговли Российской Федерации"
        } else {
            positionLabel.text = "Русскоязычное интернет-издание"
        }
            
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        positionLabel.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1)
        positionLabel.lineBreakMode = .byWordWrapping
        myViewHeader.addSubview(positionLabel)

        myViewHeader.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        myViewHeader.frame = CGRect(x: 0, y: 0, width: frame.width, height: 273)


        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        logoImageView.topAnchor.constraint(equalTo: myViewHeader.topAnchor, constant: 30).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
        veryficationButton.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: 70).isActive = true
        veryficationButton.leftAnchor.constraint(equalTo: logoImageView.leftAnchor, constant: 70).isActive = true
        veryficationButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        veryficationButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        nameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor).isActive = true

        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        positionLabel.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor).isActive = true
        positionLabel.widthAnchor.constraint(equalTo: myViewHeader.widthAnchor).isActive = true
                
        segmentedControlContainerView.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 18).isActive = true
        segmentedControlContainerView.widthAnchor.constraint(equalTo: myViewHeader.widthAnchor).isActive = true
        segmentedControlContainerView.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight).isActive = true
                
        tableview.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableview.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        // Constrain the segmented control to the container view
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlContainerView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor),
            segmentedControl.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor)
            ])

        // Constrain the underline view relative to the segmented control
        NSLayoutConstraint.activate([
            bottomUnderlineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            bottomUnderlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
            leadingDistanceConstraint,
            bottomUnderlineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
            ])
    }

}
