//
//  TwitsCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 09.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class TwitsCell: UITableViewCell {
    
    let container: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let separateView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.background
        return view
    }()
    
    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 25
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let newsImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        lbl.textColor = Colors.black
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    let positionLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        lbl.text = "Сегодня в 14:20"
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    let mainTextLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        lbl.text = "Отмечается, что страна, которая во время первой волны пандемии, в отличие от других европейских государств, не вводила широких ограничений, теперь вынуждена ввести локальные карантинные меры."
        lbl.textColor = Colors.black
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    let inPath = IndexPath()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(container)
        container.addSubview(nameLabel)
        container.addSubview(photoImageView)
        container.addSubview(positionLabel)
        container.addSubview(newsImageView)
        container.addSubview(mainTextLabel)
        container.addSubview(separateView)
        
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: TwitViewModel){
        nameLabel.text = viewModel.name
        photoImageView.image = viewModel.photoOfUser
        positionLabel.text = viewModel.time
        newsImageView.image = viewModel.newsPhoto
        mainTextLabel.text = viewModel.twitText
    }

    func setConstraints(){
        
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        container.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 430).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true

        photoImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: container.leftAnchor,constant: 15).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: 17).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        
        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 0).isActive = true
        positionLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        positionLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
        
        newsImageView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10).isActive = true
        newsImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 194).isActive = true
        
        mainTextLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 20).isActive = true
        mainTextLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 15).isActive = true
        mainTextLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -15).isActive = true
        
        separateView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        separateView.widthAnchor.constraint(equalTo: container.widthAnchor, constant: 0).isActive = true
        separateView.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }

}
