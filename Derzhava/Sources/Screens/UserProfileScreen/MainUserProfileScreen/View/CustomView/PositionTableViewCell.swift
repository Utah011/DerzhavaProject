//
//  PositionTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 01.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

//import ExpandableLabel

class PositionTableViewCell: UITableViewCell {
    
    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        //img.image = UIImage(named: "polit")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 25
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let secondPhotoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        //img.image = UIImage(named: "polit")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 25
        img.contentMode = .scaleAspectFill
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
        lbl.lineBreakMode = .byTruncatingTail
        //lbl.text = "Иван Волкодавский"
        return lbl
    }()
    
    let positionLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
        //lbl.text = "Председатель правления Приморского края"
        lbl.text = "Сегодня в 14:20"
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    let secondNameLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        //lbl.font = lbl.font.withSize(20)
        lbl.textColor = .black
        lbl.lineBreakMode = .byTruncatingTail
        //lbl.text = "Иван Волкодавский"
        return lbl
    }()
    
    let secondPositionLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
        //lbl.text = "Председатель правления Приморского края"
        lbl.text = "Сегодня в 14:20"
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    
    let mainView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let separateView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        return view
    }()
    
    let lineView: Line = {
        let view = Line()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let newsImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "positionImageCell")
        return img
    }()
    
    let headingForNews:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
        //lbl.text = "Председатель правления Приморского края"
        lbl.text = "Состояние Трампа внушает большое беспокойство"
        lbl.lineBreakMode = .byTruncatingTail
        lbl.textColor = .white
        return lbl
    }()
    
    let mainTextLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        lbl.textColor = .black
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
//        lbl.text = "Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник, Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник."
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainView)
        contentView.addSubview(separateView)
        [photoImageView,nameLabel,positionLabel,lineView,newsImageView,secondPhotoImageView,secondNameLabel,secondPositionLabel,mainTextLabel].forEach{self.mainView.addSubview($0)}
        
        newsImageView.addSubview(headingForNews)

        
        setConstraints()
        
//                let heightOfCellText = adressLabel.systemLayoutSizeFitting(CGSize(width: contentView.frame.width, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        //print("height of the cell \(heightOfCellText)")
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints(){
        
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mainView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 680).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        separateView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0).isActive = true
        separateView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        separateView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        

        photoImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 15).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        nameLabel.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 17).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        
        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 0).isActive = true
        positionLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        positionLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
        
        
        
        lineView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 0).isActive = true
        lineView.leftAnchor.constraint(equalTo: photoImageView.leftAnchor, constant: 22).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 4).isActive = true
        lineView.bottomAnchor.constraint(equalTo: secondPhotoImageView.topAnchor, constant: 0).isActive = true
        
        newsImageView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10).isActive = true
        newsImageView.leftAnchor.constraint(equalTo: lineView.rightAnchor, constant: 33.5).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 155).isActive = true
        newsImageView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0).isActive = true
        
        headingForNews.leftAnchor.constraint(equalTo: newsImageView.leftAnchor, constant: 5).isActive = true
        headingForNews.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -4).isActive = true
        headingForNews.rightAnchor.constraint(equalTo: newsImageView.rightAnchor, constant: 15).isActive = true
        
        
        
        secondPhotoImageView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 195).isActive = true
        secondPhotoImageView.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 15).isActive = true
        secondPhotoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondPhotoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondNameLabel.topAnchor.constraint(equalTo: secondPhotoImageView.topAnchor,constant: 7).isActive = true
        secondNameLabel.leftAnchor.constraint(equalTo: secondPhotoImageView.rightAnchor, constant: 10).isActive = true
        secondNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        secondNameLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        
        secondPositionLabel.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor,constant: 0).isActive = true
        secondPositionLabel.leftAnchor.constraint(equalTo: secondPhotoImageView.rightAnchor, constant: 10).isActive = true
        secondPositionLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
        
        
        
        mainTextLabel.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor,constant: 31).isActive = true
        mainTextLabel.leftAnchor.constraint(equalTo: secondPhotoImageView.rightAnchor, constant: 10).isActive = true
        //mainTextLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        //mainTextLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        mainTextLabel.bottomAnchor.constraint(equalTo: separateView.topAnchor, constant: -6).isActive = true
        mainTextLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -8).isActive = true
    }

}


class Line: UIView {
    var line = UIBezierPath()
    let colorOfLine = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)

    override func draw(_ rect: CGRect) {
        graph()
    }
    
    func graph(){
        line.move(to: .init(x: bounds.width / 2, y: bounds.height))
        line.addLine(to: .init(x: bounds.width / bounds.width + bounds.width / 2, y: bounds.height / bounds.height))
        colorOfLine.setStroke()
        line.lineWidth = 0.5
        line.stroke()
    }
}
