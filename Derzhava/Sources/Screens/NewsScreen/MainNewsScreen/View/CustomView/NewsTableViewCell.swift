//
//  NewsTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 03.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let writerLogoImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        img.contentMode = .scaleAspectFill
        img.layer.borderWidth = 1
        img.layer.borderColor = UIColor.white.cgColor
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
        return lbl
    }()
    //ГЛАВНЫЙ
    let adressLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
        return lbl
    }()
    
    let answerIconImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "humanicon")
        return img
    }()
    
    let messegeImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "vector")
        return img
    }()
    
    let askToAnswerImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.image = UIImage(named: "polit")
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 15
        return img
    }()
    
    let askToAnswerImageView2:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "sob")
        img.layer.cornerRadius = 15
        return img
    }()
    
    let askToAnswerImageView3:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "sil")
        img.layer.cornerRadius = 15
        return img
    }()
    
    let askToAnswerImageView4:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.image = UIImage(named: "milonov")
        img.contentMode = .scaleAspectFill
        //img.contentMode = .right
        img.layer.cornerRadius = 15
        return img
    }()
    
    let askToAnswerImageView5:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "zhirinovskiy")
        img.layer.cornerRadius = 15
        return img
    }()
    
    let writerSignature: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        return view
    }()
    
    let numverOfViews:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 15)
        lbl.textColor = #colorLiteral(red: 0.5254901961, green: 0.5254901961, blue: 0.5254901961, alpha: 1)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let bottomOfTheCellLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        //lbl.text = "РБК • 12:00"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 13)
        lbl.textColor = #colorLiteral(red: 0.5725490196, green: 0.5725490196, blue: 0.5725490196, alpha: 1)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let commentImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.image = UIImage(named: "polit")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 15
        return img
    }()
    
    let commentImageView2:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.image = UIImage(named: "sob")
        img.layer.cornerRadius = 15
        return img
    }()
    
    let commentImageView3:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.image = UIImage(named: "milonov")
        img.layer.cornerRadius = 15
        return img
    }()
    
    let commentImageView4:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.image = UIImage(named: "sil")
        img.contentMode = .scaleAspectFill
        
        img.layer.cornerRadius = 15
        return img
    }()
    
    let commentImageView5:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
//        img.backgroundColor = #colorLiteral(red: 0.3515200019, green: 0.7256308198, blue: 1, alpha: 1)
        img.image = UIImage(named: "+2")
        img.contentMode = .center
        img.layer.cornerRadius = 15
        return img
    }()
    
    let askToAnswerButtom:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Просят ответить", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 13)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [photoImageView, bottomView, writerLogoImageView,nameLabel, adressLabel, answerIconImageView, messegeImageView, askToAnswerImageView, askToAnswerImageView2, askToAnswerImageView3, askToAnswerImageView4, askToAnswerImageView5, numverOfViews, commentImageView, commentImageView2, commentImageView3, commentImageView4, commentImageView5,writerSignature].forEach{self.contentView.addSubview($0)}

        [bottomOfTheCellLabel,askToAnswerButtom].forEach{self.writerSignature.addSubview($0)}
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: NewsViewModel){
        photoImageView.image = viewModel.photo
        writerLogoImageView.image = viewModel.logoofwriter
        nameLabel.text = viewModel.newstitle
        adressLabel.text = viewModel.newstext
        numverOfViews.text = viewModel.numberofallviews
        bottomOfTheCellLabel.text = viewModel.signatureofwriter
    }
    
    
    
    func setConstraints(){
        
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        photoImageView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 194).isActive = true
        
        writerLogoImageView.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 10).isActive = true
        writerLogoImageView.rightAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: -10).isActive = true
        writerLogoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        writerLogoImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        bottomView.bottomAnchor.constraint(equalTo: writerSignature.topAnchor, constant: 0).isActive = true
        bottomView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 0).isActive = true
//        bottomView.heightAnchor.constraint(equalToConstant: 256).isActive = true
        bottomView.leftAnchor.constraint(equalTo: photoImageView.leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: photoImageView.rightAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10).isActive = true
//        nameLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -15).isActive = true
//        nameLabel.widthAnchor.constraint(equalToConstant: 323).isActive = true
        
        adressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        adressLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        adressLabel.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -15).isActive = true
        adressLabel.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        answerIconImageView.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 26).isActive = true
        answerIconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        answerIconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        answerIconImageView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 16).isActive = true
        
        messegeImageView.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 27).isActive = true
        messegeImageView.heightAnchor.constraint(equalToConstant: 17.61).isActive = true
        messegeImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        messegeImageView.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 164).isActive = true
        
        numverOfViews.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 27).isActive = true
        numverOfViews.heightAnchor.constraint(equalToConstant: 17.61).isActive = true
        numverOfViews.widthAnchor.constraint(equalToConstant: 35).isActive = true
        numverOfViews.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 326.97).isActive = true
        
        
        
        askToAnswerImageView.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        askToAnswerImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView.leftAnchor.constraint(equalTo: answerIconImageView.rightAnchor, constant: 11).isActive = true
        
        askToAnswerImageView2.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        askToAnswerImageView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView2.leftAnchor.constraint(equalTo: answerIconImageView.rightAnchor, constant: 27).isActive = true
        
        askToAnswerImageView3.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        askToAnswerImageView3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView3.leftAnchor.constraint(equalTo: answerIconImageView.rightAnchor, constant: 43).isActive = true
        
        askToAnswerImageView4.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        askToAnswerImageView4.heightAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView4.widthAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView4.leftAnchor.constraint(equalTo: answerIconImageView.rightAnchor, constant: 59).isActive = true
        
        askToAnswerImageView5.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        askToAnswerImageView5.heightAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView5.widthAnchor.constraint(equalToConstant: 30).isActive = true
        askToAnswerImageView5.leftAnchor.constraint(equalTo: answerIconImageView.rightAnchor, constant: 75).isActive = true
        
        
        
        commentImageView.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        commentImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView.leftAnchor.constraint(equalTo: messegeImageView.rightAnchor, constant: 11).isActive = true
        
        commentImageView2.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        commentImageView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView2.leftAnchor.constraint(equalTo: messegeImageView.rightAnchor, constant: 27).isActive = true
        
        commentImageView3.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        commentImageView3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView3.leftAnchor.constraint(equalTo: messegeImageView.rightAnchor, constant: 43).isActive = true
        
        commentImageView4.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        commentImageView4.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView4.widthAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView4.leftAnchor.constraint(equalTo: messegeImageView.rightAnchor, constant: 59).isActive = true
        
        commentImageView5.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
        commentImageView5.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView5.widthAnchor.constraint(equalToConstant: 30).isActive = true
        commentImageView5.leftAnchor.constraint(equalTo: messegeImageView.rightAnchor, constant: 75).isActive = true
        
        writerSignature.topAnchor.constraint(equalTo: askToAnswerImageView.bottomAnchor, constant: 10).isActive = true
        writerSignature.leftAnchor.constraint(equalTo: photoImageView.leftAnchor).isActive = true
        writerSignature.rightAnchor.constraint(equalTo: photoImageView.rightAnchor).isActive = true
        writerSignature.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        bottomOfTheCellLabel.topAnchor.constraint(equalTo: writerSignature.topAnchor, constant: 10).isActive = true
        bottomOfTheCellLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        bottomOfTheCellLabel.leftAnchor.constraint(equalTo: writerSignature.leftAnchor, constant: 151).isActive = true
        
        askToAnswerButtom.topAnchor.constraint(equalTo: bottomOfTheCellLabel.bottomAnchor, constant: 10).isActive = true
        askToAnswerButtom.centerXAnchor.constraint(equalTo: writerSignature.centerXAnchor, constant: 0).isActive = true
        
    }

}
