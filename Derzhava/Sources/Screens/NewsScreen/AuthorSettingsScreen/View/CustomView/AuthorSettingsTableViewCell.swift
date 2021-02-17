//
//  File.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 25.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation

import UIKit
//главный
class AuthorSettingsTableViewCell: UITableViewCell {
    
    let numberOfPostsLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Размещено публикаций"
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        return lbl
    }()
    
    let needToPayLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "К оплате"
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        return lbl
    }()
    
    let exactlyNumberOfPostsLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "3"
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        return lbl
    }()
    
    let totalPriceLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "105 000 Р"
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        return lbl
    }()
    
    let chooseAPaymentMethodButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
        btn.setTitle("Выбрать способ оплаты", for: .normal)
        return btn
        }()
    
    let contactSupportLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Связаться с поддержкой"
        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 15)
        return lbl
    }()
    
    
    
    
    let phoneButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "phoneicon"), for: .normal)
        return btn
    }()
    
    let massageButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "massageicon"), for: .normal)
        return btn
    }()
    
    let whatsupButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "whatsupicon"), for: .normal)
        return btn
    }()
    
    let vkButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "vkicon"), for: .normal)
        return btn
    }()
    
    let facebookButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "facebookicon"), for: .normal)
        return btn
    }()
    
    let telegramButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "telegramicon"), for: .normal)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        contentView.backgroundColor = .systemRed
        addSubViews()
        setConstrains()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews(){
        [numberOfPostsLabel,needToPayLabel,exactlyNumberOfPostsLabel,totalPriceLabel,chooseAPaymentMethodButton,contactSupportLabel,phoneButton,massageButton,whatsupButton,vkButton,facebookButton,telegramButton].forEach{self.contentView.addSubview($0)}
    }
    
    func setConstrains(){
        numberOfPostsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        numberOfPostsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        
        needToPayLabel.topAnchor.constraint(equalTo: numberOfPostsLabel.bottomAnchor, constant: 10).isActive = true
        needToPayLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        
        exactlyNumberOfPostsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        exactlyNumberOfPostsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -14).isActive = true
        
        totalPriceLabel.topAnchor.constraint(equalTo: exactlyNumberOfPostsLabel.bottomAnchor, constant: 10).isActive = true
        totalPriceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -14).isActive = true
        
        chooseAPaymentMethodButton.topAnchor.constraint(equalTo: needToPayLabel.bottomAnchor, constant: 20).isActive = true
        chooseAPaymentMethodButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        chooseAPaymentMethodButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        chooseAPaymentMethodButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contactSupportLabel.topAnchor.constraint(equalTo: chooseAPaymentMethodButton.bottomAnchor, constant: 30).isActive = true
        contactSupportLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        
        
        
        phoneButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
        phoneButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        
        massageButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
        massageButton.leftAnchor.constraint(equalTo: phoneButton.rightAnchor, constant: 15).isActive = true
        
        whatsupButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
        whatsupButton.leftAnchor.constraint(equalTo: massageButton.rightAnchor, constant: 15).isActive = true
        
        vkButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
        vkButton.leftAnchor.constraint(equalTo: whatsupButton.rightAnchor, constant: 15).isActive = true
        
        facebookButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
        facebookButton.leftAnchor.constraint(equalTo: vkButton.rightAnchor, constant: 15).isActive = true
        
        telegramButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
        telegramButton.leftAnchor.constraint(equalTo: facebookButton.rightAnchor, constant: 15).isActive = true

    }



}
