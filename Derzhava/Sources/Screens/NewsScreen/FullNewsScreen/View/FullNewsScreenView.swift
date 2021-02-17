//
//  FullNewsScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 13.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class FullNewsScreenView: UIView {
    
    let tableview = UITableView()
    let footerForTableView = UIView()
    let footerPhotoForTableView = UIImageView()
    let footerTextFieldForTableView = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .singleLine
        tableview.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        addSubview(tableview)
        
        footerForTableView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        footerForTableView.layer.borderWidth = 0.5
        footerForTableView.layer.borderColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)

        footerPhotoForTableView.image = UIImage(named: "polit")
        footerPhotoForTableView.clipsToBounds = true
        footerPhotoForTableView.layer.cornerRadius = 16
        footerPhotoForTableView.contentMode = .scaleAspectFill
        footerForTableView.addSubview(footerPhotoForTableView)

        footerTextFieldForTableView.placeholder = "Напишите ответ"
        footerTextFieldForTableView.clipsToBounds = true
        footerTextFieldForTableView.layer.cornerRadius = 10
        footerTextFieldForTableView.backgroundColor = .white
        footerTextFieldForTableView.layer.borderWidth = 1
        footerTextFieldForTableView.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        footerForTableView.addSubview(footerTextFieldForTableView)
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
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.footerTextFieldForTableView.frame.height))
        footerTextFieldForTableView.leftView = paddingView
        footerTextFieldForTableView.leftViewMode = UITextField.ViewMode.always
    }

}
