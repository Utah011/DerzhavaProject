//
//  FlowCollectionViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 16.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class FlowCollectionViewCell: UICollectionViewCell {

    let titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        //lbl.text = "Почему ВВП не растет с 2008 года?"
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
        return lbl
    }()
    
    let mainTextLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        //lbl.text = "Несмотря на внешнее сходство с кризисами 1998 и 2008 гг., последний спад оказался куда глубже и сложнее. Его можно сравнить лишь трансформационным периодом 1990-х гг."
        lbl.font = UIFont(name: "SFProText-Regular", size: 13)
        return lbl
    }()
    
    let newOpinionsLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Новые мнения"
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
        return lbl
    }()
    
    let allOpinionsLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Всего мнений: 13"
        lbl.font = UIFont(name: "SFProText-Regular", size: 12)
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    let container:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "polit")
        img.clipsToBounds = true
        img.layer.cornerRadius = 32.5
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let firstNameLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.text = "Денис Мантуров"
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let secondImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "zhirinovskiy")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 32.5
        return img
    }()
    
    let secondNameLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.text = "Владимир Жириновский"
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let thirdImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "milonov")
        img.clipsToBounds = true
        img.layer.cornerRadius = 32.5
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let thirdNameLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.text = "Виталий Милонов"
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let fourthImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "sob")
        img.clipsToBounds = true
        img.layer.cornerRadius = 32.5
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let fourthNameLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.text = "Сергей Собянин"
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        addSubviews()
        setConstrains()
        print(";eorngorngoiwgnwgNWOGNWEGWEIOG")
        print(contentView.frame.width)
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: EternalQuestionsViewModel){
        titleLabel.text = viewModel.title
        mainTextLabel.text = viewModel.mainText
    }
    
    func addSubviews(){
        [titleLabel,mainTextLabel,newOpinionsLabel,allOpinionsLabel,firstImageView,firstNameLabel,secondImageView,secondNameLabel,thirdImageView,thirdNameLabel,fourthImageView,fourthNameLabel].forEach{self.contentView.addSubview($0)}
    }
    
    func setConstrains(){
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        mainTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        mainTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        mainTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        newOpinionsLabel.topAnchor.constraint(equalTo: mainTextLabel.bottomAnchor, constant: 15).isActive = true
        newOpinionsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        allOpinionsLabel.topAnchor.constraint(equalTo: mainTextLabel.bottomAnchor, constant: 15).isActive = true
        allOpinionsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        firstImageView.topAnchor.constraint(equalTo: newOpinionsLabel.bottomAnchor, constant: 10).isActive = true
        firstImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        firstImageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        firstImageView.heightAnchor.constraint(equalToConstant: 65).isActive = true

        firstNameLabel.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 15).isActive = true
        firstNameLabel.leftAnchor.constraint(equalTo: firstImageView.leftAnchor, constant: 0).isActive = true
        firstNameLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        secondImageView.topAnchor.constraint(equalTo: newOpinionsLabel.bottomAnchor, constant: 10).isActive = true
        secondImageView.leftAnchor.constraint(equalTo: firstImageView.rightAnchor, constant: 15).isActive = true
//        secondImageView.leftAnchor.constraint(equalTo: firstImageView.rightAnchor, constant: contentView.frame.width / 4 - 65).isActive = true
        secondImageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        secondImageView.heightAnchor.constraint(equalToConstant: 65).isActive = true

        secondNameLabel.topAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: 15).isActive = true
        secondNameLabel.leftAnchor.constraint(equalTo: secondImageView.leftAnchor, constant: 0).isActive = true
        secondNameLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        thirdImageView.topAnchor.constraint(equalTo: newOpinionsLabel.bottomAnchor, constant: 10).isActive = true
        thirdImageView.leftAnchor.constraint(equalTo: secondImageView.rightAnchor, constant: 15).isActive = true
        thirdImageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        thirdImageView.heightAnchor.constraint(equalToConstant: 65).isActive = true

        thirdNameLabel.topAnchor.constraint(equalTo: thirdImageView.bottomAnchor, constant: 15).isActive = true
        thirdNameLabel.leftAnchor.constraint(equalTo: thirdImageView.leftAnchor, constant: 0).isActive = true
        thirdNameLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        fourthImageView.topAnchor.constraint(equalTo: newOpinionsLabel.bottomAnchor, constant: 10).isActive = true
        fourthImageView.leftAnchor.constraint(equalTo: thirdImageView.rightAnchor, constant: 15).isActive = true
        fourthImageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        fourthImageView.heightAnchor.constraint(equalToConstant: 65).isActive = true

        fourthNameLabel.topAnchor.constraint(equalTo: fourthImageView.bottomAnchor, constant: 15).isActive = true
        fourthNameLabel.leftAnchor.constraint(equalTo: fourthImageView.leftAnchor, constant: 0).isActive = true
        fourthNameLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
    }
}

