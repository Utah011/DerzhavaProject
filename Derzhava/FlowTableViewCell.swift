//
//  FlowTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 11.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit
//import ExpandableLabel

class FlowTableViewCell: UITableViewCell {
    
    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.image = UIImage(named: "varlamov")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        return img
    }()
    
    
    let bottomView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.layer.cornerRadius = 16
        //view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()

    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        //lbl.font = lbl.font.withSize(20)
        lbl.textColor = .black
        lbl.lineBreakMode = .byWordWrapping
        lbl.text = "Hola Hola"
        return lbl
    }()
    
    let adressLabel:UILabel = {
        let lbl = UILabel()
        //lbl.numberOfLines = 5
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        lbl.textColor = .black
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
        lbl.text = "Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник, который цитируют журналисты президентского номера. Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник, который цитируют журналисты президентского номера."
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let myButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitleColor(UIColor(red: 0.176, green: 0.322, blue: 0.486, alpha: 1), for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)

        btn.setTitle("Далее", for: .normal)
        btn.titleLabel?.font = UIFont(name: "OpenSans-SemiBold", size: 20)
        btn.layer.cornerRadius = 16
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let positionLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
        lbl.text = "llololol"
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    let timeLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 12)
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
        lbl.text = "14:20"
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [].forEach{self.contentView.addSubview($0)}
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(photoImageView)
        contentView.addSubview(adressLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(timeLabel)
        //contentView.addSubview(myButton)
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints(){

        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 0).isActive = true
        positionLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
//        positionLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        positionLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
//        positionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        adressLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor,constant: 11).isActive = true
//        adressLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        adressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 75).isActive = true
//        adressLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
//        adressLabel.widthAnchor.constraint(equalToConstant: 290).isActive = true
        adressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        adressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true

        
//        myButton.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 10).isActive = true
//        myButton.leftAnchor.constraint(equalTo: adressLabel.leftAnchor, constant: 20).isActive = true
//        myButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
////        myButton.heightAnchor.constraint(equalToConstant: 30).isActive  = true
//        myButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true

    }

}
