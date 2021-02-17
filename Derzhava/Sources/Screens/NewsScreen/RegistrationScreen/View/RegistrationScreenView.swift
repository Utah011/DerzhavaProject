//
//  RegistrationScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 16.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class RegistrationScreenView: UIView {
    
    let registrationLabel = UILabel()
    let nameTextField = UITextField()
    let phoneTextField = UITextField()
    let subjectTextField = UITextField()
    let nameBottomLine = UIView()
    let phoneBottomLine = UIView()
    let subjectBottomLine = UIView()
    let registrationButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        

        registrationLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationLabel.text = "Регистрация"
        registrationLabel.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        addSubview(registrationLabel)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Имя или учреждение"
        addSubview(nameTextField)
        
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.placeholder = "Телефон"
        phoneTextField.keyboardType = .decimalPad
        addSubview(phoneTextField)
        
        subjectTextField.translatesAutoresizingMaskIntoConstraints = false
        subjectTextField.placeholder = "Субъект"
        addSubview(subjectTextField)
        
        nameBottomLine.translatesAutoresizingMaskIntoConstraints = false
        nameBottomLine.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
        addSubview(nameBottomLine)
        
        phoneBottomLine.translatesAutoresizingMaskIntoConstraints = false
        phoneBottomLine.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
        addSubview(phoneBottomLine)

        subjectBottomLine.translatesAutoresizingMaskIntoConstraints = false
        subjectBottomLine.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
        addSubview(subjectBottomLine)
        
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.clipsToBounds = true
        registrationButton.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        registrationButton.layer.cornerRadius = 8
        registrationButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        addSubview(registrationButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        registrationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        registrationLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 100).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 44).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -44).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        nameBottomLine.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 6).isActive = true
        nameBottomLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 44).isActive = true
        nameBottomLine.rightAnchor.constraint(equalTo: rightAnchor, constant: -44).isActive = true
        nameBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true

        phoneTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 56).isActive = true
        phoneTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 44).isActive = true
        phoneTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -44).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        phoneBottomLine.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 6).isActive = true
        phoneBottomLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 44).isActive = true
        phoneBottomLine.rightAnchor.constraint(equalTo: rightAnchor, constant: -44).isActive = true
        phoneBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        subjectTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 56).isActive = true
        subjectTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 44).isActive = true
        subjectTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -44).isActive = true
        subjectTextField.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        subjectBottomLine.topAnchor.constraint(equalTo: subjectTextField.bottomAnchor, constant: 6).isActive = true
        subjectBottomLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 44).isActive = true
        subjectBottomLine.rightAnchor.constraint(equalTo: rightAnchor, constant: -44).isActive = true
        subjectBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        registrationButton.topAnchor.constraint(equalTo: subjectTextField.bottomAnchor, constant: 168).isActive = true
        registrationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        registrationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
