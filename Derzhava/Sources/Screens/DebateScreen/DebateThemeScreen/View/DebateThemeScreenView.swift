//
//  DebateThemeScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 15.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class DebateThemeScreenView: UIView {
    
    let tableview = UITableView()
    let myHeaderView = UIView()
    let myHeaderTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .singleLine
        addSubview(tableview)
        
        myHeaderView.backgroundColor = Colors.background
        myHeaderView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 78)
        
        myHeaderTitle.translatesAutoresizingMaskIntoConstraints = false
        myHeaderTitle.text = "Тема"
        myHeaderTitle.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        myHeaderView.addSubview(myHeaderTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableview.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        tableview.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        tableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true

        myHeaderTitle.topAnchor.constraint(equalTo: myHeaderView.topAnchor, constant: 30).isActive = true
        myHeaderTitle.leftAnchor.constraint(equalTo: myHeaderView.leftAnchor, constant: 16).isActive = true
    }

}
