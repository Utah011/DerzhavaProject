//
//  DebateScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 15.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class DebateScreenView: UIView {
    
    var col = NSLayoutConstraint()
    var collectionThemeView: UICollectionView!
    let tableThemeView = UITableView()
    let titleLabelForNavController = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .horizontal
        
        collectionThemeView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionThemeView.translatesAutoresizingMaskIntoConstraints = false
        collectionThemeView.backgroundColor = UIColor(red: 249, green: 249, blue: 249, alpha: 0)
        collectionThemeView.showsHorizontalScrollIndicator = false
        addSubview(collectionThemeView)

        tableThemeView.translatesAutoresizingMaskIntoConstraints = false
        tableThemeView.separatorStyle = .none
        tableThemeView.isScrollEnabled = true
        tableThemeView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        addSubview(tableThemeView)

        titleLabelForNavController.translatesAutoresizingMaskIntoConstraints = false
        titleLabelForNavController.text = "Дебаты"
        titleLabelForNavController.font = UIFont(name: "SFProDisplay-Bold", size: 34)
        titleLabelForNavController.textColor = .black
        addSubview(titleLabelForNavController)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let col = collectionThemeView.topAnchor.constraint(equalTo: topAnchor, constant: 150)
        col.isActive = true
        collectionThemeView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        collectionThemeView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        collectionThemeView.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        titleLabelForNavController.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        titleLabelForNavController.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleLabelForNavController.bottomAnchor.constraint(equalTo: collectionThemeView.topAnchor, constant: -21).isActive = true

        tableThemeView.topAnchor.constraint(equalTo: collectionThemeView.bottomAnchor, constant: 20).isActive = true
        tableThemeView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tableThemeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}
