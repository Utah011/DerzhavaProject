//
//  SearchNewsTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 19.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class SearchNewsTableViewCell: UITableViewCell {
    
    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.layer.masksToBounds = false
        img.image = UIImage(named: "trum")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = img.frame.size.width / 2
        img.contentMode = .scaleToFill
        return img
    }()
        
    var titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        lbl.textColor = Colors.black
        lbl.text = "Состояние Трампа внушает большое беспокойство"
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    var newsLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Новость"
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1)
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Colors.background
        
        [photoImageView,titleLabel,newsLabel].forEach{self.contentView.addSubview($0)}
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
        
        newsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26.5).isActive = true
        newsLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 15).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: newsLabel.bottomAnchor,constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        

    }

}
