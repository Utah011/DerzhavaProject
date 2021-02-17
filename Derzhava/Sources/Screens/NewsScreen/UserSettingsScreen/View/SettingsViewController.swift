//
//  SettingsViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 21.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let contentView = SettingsScreenView()
    
//    let notificationLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Получать уведомления"
//        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
//        return lbl
//    }()
//    
//    let notificationSwitch:UISwitch = {
//        let swtch = UISwitch()
//        swtch.translatesAutoresizingMaskIntoConstraints = false
//        swtch.isOn = true
//        return swtch
//    }()
//    
//    let contactSupportLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Связаться с поддержкой"
//        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
//        return lbl
//    }()
//    
//    let phoneButton:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setImage(UIImage(named: "phoneicon"), for: .normal)
//        return btn
//    }()
//    
//    let massageButton:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setImage(UIImage(named: "massageicon"), for: .normal)
//        return btn
//    }()
//    
//    let whatsupButton:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setImage(UIImage(named: "whatsupicon"), for: .normal)
//        return btn
//    }()
//    
//    let vkButton:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setImage(UIImage(named: "vkicon"), for: .normal)
//        return btn
//    }()
//    
//    let facebookButton:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setImage(UIImage(named: "facebookicon"), for: .normal)
//        return btn
//    }()
//    
//    let telegramButton:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setImage(UIImage(named: "telegramicon"), for: .normal)
//        return btn
//    }()
//    
//    let buttonRegistration:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setTitle("Перейти на аккаунт автора", for: .normal)
//        btn.setTitleColor(#colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1), for: .normal)
//        btn.addTarget(self, action: #selector(goToRegistration), for: .touchUpInside)
//        return btn
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        setNavigationController()
        contentView.buttonRegistration.addTarget(self, action: #selector(goToRegistration), for: .touchUpInside)
//        addSubViews()
//        setConstrains()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Настройки"
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
    }
    
//    func addSubViews(){
//        [notificationLabel,notificationSwitch,contactSupportLabel,phoneButton,massageButton,whatsupButton,vkButton,facebookButton,telegramButton,buttonRegistration].forEach{self.view.addSubview($0)}
//    }
    
    @objc
    func goToRegistration(){
        let defaulVC = RegistrationViewController()
        self.navigationController?.pushViewController(defaulVC, animated: true)
    }
    
//    func setConstrains(){
//        notificationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 34).isActive = true
//        notificationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//
//        notificationSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
//        notificationSwitch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -17).isActive = true
//
//        contactSupportLabel.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 25).isActive = true
//        contactSupportLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//
//        phoneButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
//        phoneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//
//        massageButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
//        massageButton.leftAnchor.constraint(equalTo: phoneButton.rightAnchor, constant: 15).isActive = true
//
//        whatsupButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
//        whatsupButton.leftAnchor.constraint(equalTo: massageButton.rightAnchor, constant: 15).isActive = true
//
//        vkButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
//        vkButton.leftAnchor.constraint(equalTo: whatsupButton.rightAnchor, constant: 15).isActive = true
//
//        facebookButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
//        facebookButton.leftAnchor.constraint(equalTo: vkButton.rightAnchor, constant: 15).isActive = true
//
//        telegramButton.topAnchor.constraint(equalTo: contactSupportLabel.bottomAnchor, constant: 12).isActive = true
//        telegramButton.leftAnchor.constraint(equalTo: facebookButton.rightAnchor, constant: 15).isActive = true
//
//        buttonRegistration.topAnchor.constraint(equalTo: phoneButton.bottomAnchor, constant: 37).isActive = true
//        buttonRegistration.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//
//    }

}
