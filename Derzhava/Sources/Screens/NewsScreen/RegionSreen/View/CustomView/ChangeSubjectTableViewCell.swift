//
//  ChangeSubjectTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 14.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit
//import ExpandableLabel

class ChangeSubjectTableViewCell: UITableViewCell {
    
    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        //img.image = UIImage(named: "gerb")
        img.translatesAutoresizingMaskIntoConstraints = false
//        img.layer.cornerRadius = 37.5
        img.contentMode = .scaleAspectFit
        //img.layer.cornerRadius = 16
        return img
    }()
        
    var subjectLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        lbl.textColor = .black
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let checkMark:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "mark")
        img.isHidden = false
        return img
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)

        
        [photoImageView,subjectLabel,checkMark].forEach{self.contentView.addSubview($0)}
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints(){

        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        subjectLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        subjectLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 15).isActive = true
        subjectLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        
        checkMark.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        checkMark.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        checkMark.widthAnchor.constraint(equalToConstant: 15).isActive = true
        checkMark.heightAnchor.constraint(equalToConstant: 14.6).isActive = true

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            checkMark.isHidden = false
        } else {
            checkMark.isHidden = true
        }
    }

}

