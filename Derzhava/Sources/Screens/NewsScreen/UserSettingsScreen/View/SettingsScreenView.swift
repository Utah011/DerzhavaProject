//
//  SettingsScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 13.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class SettingsScreenView: UIView {
    
    let notificationLabel = UILabel()
    let notificationSwitch = UISwitch()
    let contactSupportLabel = UILabel()
    let phoneButton = UIButton()
    let massageButton = UIButton()
    let whatsupButton = UIButton()
    let vkButton = UIButton()
    let facebookButton = UIButton()
    let telegramButton = UIButton()
    let buttonRegistration = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationLabel.text = "Получать уведомления"
        notificationLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        addSubview(notificationLabel)
        
        notificationSwitch.translatesAutoresizingMaskIntoConstraints = false
        notificationSwitch.isOn = true
        addSubview(notificationSwitch)
        
        contactSupportLabel.translatesAutoresizingMaskIntoConstraints = false
        contactSupportLabel.text = "Связаться с поддержкой"
        contactSupportLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        addSubview(contactSupportLabel)
        
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.setImage(UIImage(named: "phoneicon"), for: .normal)
        addSubview(phoneButton)
        
        massageButton.translatesAutoresizingMaskIntoConstraints = false
        massageButton.setImage(UIImage(named: "massageicon"), for: .normal)
        addSubview(massageButton)
        
        whatsupButton.translatesAutoresizingMaskIntoConstraints = false
        whatsupButton.setImage(UIImage(named: "whatsupicon"), for: .normal)
        addSubview(whatsupButton)
        
        vkButton.translatesAutoresizingMaskIntoConstraints = false
        vkButton.setImage(UIImage(named: "vkicon"), for: .normal)
        addSubview(vkButton)
        
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.setImage(UIImage(named: "facebookicon"), for: .normal)
        addSubview(facebookButton)
        
        telegramButton.translatesAutoresizingMaskIntoConstraints = false
        telegramButton.setImage(UIImage(named: "telegramicon"), for: .normal)
        addSubview(telegramButton)
        
        buttonRegistration.translatesAutoresizingMaskIntoConstraints = false
        buttonRegistration.setTitle("Перейти на аккаунт автора", for: .normal)
        buttonRegistration.setTitleColor(#colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1), for: .normal)
//        buttonRegistration.addTarget(self, action: #selector(goToRegistration), for: .touchUpInside)
        addSubview(buttonRegistration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        notificationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 34).isActive = true
        notificationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        
        notificationSwitch.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        notificationSwitch.rightAnchor.constraint(equalTo: rightAnchor, constant: -17).isActive = true
        
        contactSupportLabel.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 25).isActive = true
        contactSupportLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true

        phoneButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
        phoneButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        
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
        
        buttonRegistration.topAnchor.constraint(equalTo: phoneButton.bottomAnchor, constant: 37).isActive = true
        buttonRegistration.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
    }

}
