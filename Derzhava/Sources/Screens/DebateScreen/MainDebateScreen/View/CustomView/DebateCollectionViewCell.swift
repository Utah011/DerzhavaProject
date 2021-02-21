//
//  DebateCollectionViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 21.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class DebateCollectionViewCell: UICollectionViewCell {
    let firstSubjectLabel:UILabel = {
        let lbl = UILabel()
        //lbl.text = "Тэкс тэкс"
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 15)
        lbl.textColor = Colors.darkBlue
        lbl.lineBreakMode = .byWordWrapping
        lbl.backgroundColor = Colors.background
        lbl.layer.cornerRadius = 5
        lbl.layer.borderWidth = 1.3
        lbl.layer.borderColor = Colors.darkBlue?.cgColor
        return lbl
    }()
    
    let a = DebateViewController()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(firstSubjectLabel)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 5
        
        firstSubjectLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        firstSubjectLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        firstSubjectLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        firstSubjectLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
