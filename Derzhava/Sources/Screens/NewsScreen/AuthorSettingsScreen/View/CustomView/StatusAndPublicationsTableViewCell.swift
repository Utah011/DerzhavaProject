//
//  StatusAndPublicationsTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 25.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class StatusAndPublicationsTableViewCell: UITableViewCell {
    
    var photoImageView:UIImageView = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        return imgview
    }()
    
    let titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 15)
        return lbl
    }()
    
    let publicationStatusLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Ждет публикации"
        lbl.font = UIFont(name: "SFProText-Regular", size: 12)
        lbl.textColor = #colorLiteral(red: 0.5254901961, green: 0.5254901961, blue: 0.5254901961, alpha: 1)
        return lbl
    }()
    
    let publicationTimeLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "24.10 20:00"
        lbl.font = UIFont(name: "SFProText-Regular", size: 12)
        lbl.textColor = #colorLiteral(red: 0.5254901961, green: 0.5254901961, blue: 0.5254901961, alpha: 1)
        return lbl
    }()
    
    let bottomView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.background
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Colors.white
        addSubviews()
        setConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        [photoImageView,titleLabel,publicationStatusLabel,publicationTimeLabel,bottomView].forEach{self.contentView.addSubview($0)}
    }
    
    func setConstrains(){
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        publicationStatusLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        publicationStatusLabel.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -10).isActive = true
        publicationStatusLabel.widthAnchor.constraint(equalToConstant: 138).isActive = true
        
        publicationTimeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        publicationTimeLabel.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -10).isActive = true
        
        bottomView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 0).isActive = true
        bottomView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }

}
