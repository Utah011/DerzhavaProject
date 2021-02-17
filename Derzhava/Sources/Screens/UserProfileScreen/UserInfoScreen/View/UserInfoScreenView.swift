//
//  UserInfoScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 16.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class UserInfoScreenView: UIView {
    
    let myScrollView = UIScrollView()
    let nameLabel = UILabel()
    let aboutAuthorLabel = UILabel()
    let aboutAuthorTextLabel = UILabel()
    let awardsLabel = UILabel()
    var awardsTextLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
// ScrollView
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(myScrollView)
        
// Name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 1
        nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        if flag == 1 {
            nameLabel.text = "Денис Мантуров"
        } else {
            nameLabel.text = "РИА"
        }
        myScrollView.addSubview(nameLabel)
        
// About author label
        aboutAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutAuthorLabel.numberOfLines = 1
        aboutAuthorLabel.font = UIFont(name: "SFProDisplay-SemiBold", size: 17)
        aboutAuthorLabel.text = "Об авторе"
        myScrollView.addSubview(aboutAuthorLabel)
        
// About author text
        aboutAuthorTextLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutAuthorTextLabel.textAlignment = .left
        aboutAuthorTextLabel.lineBreakMode = .byWordWrapping
        aboutAuthorTextLabel.numberOfLines = 0
        aboutAuthorTextLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        if flag == 1 {
            aboutAuthorTextLabel.text = "Российский государственный деятель. Заместитель руководителя Администрации президента Российской Федерации — пресс-секретарь президента Российской Федерации Владимира Путина с 22 мая 2012 года. Действительный государственный советник Российской Федерации 1 класса (2005)."
        } else {
            aboutAuthorTextLabel.text = "Российский медиахолдинг, включающий одноимённый телеканал, информационное агентство, газету и журнал. Проводит отраслевые конференции, бизнес-регаты и премии. Является крупнейшим из негосударственных медиахолдингов России. Штаб-квартира находится в Москве"
        }
        myScrollView.addSubview(aboutAuthorTextLabel)

// Author's awards label
        awardsLabel.translatesAutoresizingMaskIntoConstraints = false
        awardsLabel.numberOfLines = 1
        awardsLabel.font = UIFont(name: "SFProDisplay-SemiBold", size: 17)
            
            if flag == 1 {
                awardsLabel.text = "Награды"
            } else {
                awardsLabel.text = "Управление"
            }
        myScrollView.addSubview(awardsLabel)
        
// About author's awards
        awardsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        awardsTextLabel.textAlignment = .left
        awardsTextLabel.lineBreakMode = .byWordWrapping
        awardsTextLabel.numberOfLines = 0
        awardsTextLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        if flag == 1 {
            awardsTextLabel.text = "• Орден Почёта (6 августа 2007 года) — за активное участие в работе по обеспечению победы заявки города Сочи на право проведения XXII зимних Олимпийских и XI Паралимпийских игр в 2014 году[70]. \n• Орден Дружбы (22 ноября 2003 года) — за активную работу по подготовке и проведению международных встреч по случаю 300-летия Санкт-Петербурга[71]. \n• Орден «Манас» III степени (16 июня 2017 года, Киргизия) — за активное участие в развитии кыргызско-российского социально-экономического сотрудничества и укреплении межгосударственных взаимоотношений[72][73]. \n• Командор ордена «За заслуги перед Итальянской Республикой» (4 октября 2017 года, Италия)[74]. \n• Две благодарности президента РФ (2004, 2007) и благодарность правительства РФ (2009)[5]."
        } else {
            awardsTextLabel.text = "Владелец — Григорий Берёзкин, Генеральный директор — Николай Молибог"
        }
        myScrollView.addSubview(awardsTextLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        myScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        myScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        myScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: myScrollView.topAnchor, constant: 30).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        
        aboutAuthorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        aboutAuthorLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        
        aboutAuthorTextLabel.topAnchor.constraint(equalTo: aboutAuthorLabel.bottomAnchor, constant: 0).isActive = true
        aboutAuthorTextLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        aboutAuthorTextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        
        awardsLabel.topAnchor.constraint(equalTo: aboutAuthorTextLabel.bottomAnchor, constant: 30).isActive = true
        awardsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        
        awardsTextLabel.topAnchor.constraint(equalTo: awardsLabel.bottomAnchor, constant: 0).isActive = true
        awardsTextLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        awardsTextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        
        let heightOfAboutAuthorTextLabel = aboutAuthorTextLabel.systemLayoutSizeFitting(CGSize(width: frame.width, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        print("u got it \(heightOfAboutAuthorTextLabel)")
        
        let heightOfAwardsTextLabel = awardsTextLabel.systemLayoutSizeFitting(CGSize(width: frame.width, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        print("u got it \(heightOfAwardsTextLabel)")
        
        myScrollView.contentSize = CGSize(width: frame.width, height: 300 + heightOfAboutAuthorTextLabel + heightOfAwardsTextLabel)
    }

}
