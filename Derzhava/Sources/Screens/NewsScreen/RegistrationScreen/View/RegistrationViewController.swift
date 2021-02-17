//
//  RegistrationViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 22.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    let contentView = RegistrationScreenView()
//    let registrationLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Регистрация"
//        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 28)
//        return lbl
//    }()
//
//    let nameTextField:UITextField = {
//        let txt = UITextField()
//        txt.translatesAutoresizingMaskIntoConstraints = false
//        txt.placeholder = "Имя или учреждение"
//        return txt
//    }()
//
//    let phoneTextField:UITextField = {
//        let txt = UITextField()
//        txt.translatesAutoresizingMaskIntoConstraints = false
//        txt.placeholder = "Телефон"
//        txt.keyboardType = .decimalPad
//        return txt
//    }()
//
//    let subjectTextField:UITextField = {
//        let txt = UITextField()
//        txt.translatesAutoresizingMaskIntoConstraints = false
//        txt.placeholder = "Субъект"
//        return txt
//    }()
//
//    let nameBottomLine:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
//        return view
//    }()
//
//    let phoneBottomLine:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
//        return view
//    }()
//
//    let subjectBottomLine:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
//        return view
//    }()
//
//    let registrationButton:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.clipsToBounds = true
//        btn.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//        btn.layer.cornerRadius = 8
//        btn.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
//        btn.setTitle("Зарегистрироваться", for: .normal)
//        btn.addTarget(self, action: #selector(goToNewsScreen), for: .touchUpInside)
//        return btn
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        
        setNavigationController()
        setContentView()
        textFieldSettings()
//        addSubViews()
//        setConstrains()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setContentView(){
        contentView.registrationButton.addTarget(self, action: #selector(goToNewsScreen), for: .touchUpInside)
    }
    
    func textFieldSettings(){
        contentView.nameTextField.delegate = self
        contentView.phoneTextField.delegate = self
        contentView.subjectTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentView.nameTextField.becomeFirstResponder()
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
//    func addSubViews(){
//        [registrationLabel,nameTextField,phoneTextField,subjectTextField,registrationButton,nameBottomLine,phoneBottomLine,subjectBottomLine].forEach{self.view.addSubview($0)}
//    }
//
//    func setConstrains(){
//        registrationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
//        registrationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//
//        nameTextField.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 100).isActive = true
//        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44).isActive = true
//        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44).isActive = true
//        nameTextField.heightAnchor.constraint(equalToConstant: 21).isActive = true
//
//        nameBottomLine.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 6).isActive = true
//        nameBottomLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44).isActive = true
//        nameBottomLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44).isActive = true
//        nameBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
//
//        phoneTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 56).isActive = true
//        phoneTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44).isActive = true
//        phoneTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44).isActive = true
//        phoneTextField.heightAnchor.constraint(equalToConstant: 21).isActive = true
//
//        phoneBottomLine.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 6).isActive = true
//        phoneBottomLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44).isActive = true
//        phoneBottomLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44).isActive = true
//        phoneBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
//
//        subjectTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 56).isActive = true
//        subjectTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44).isActive = true
//        subjectTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44).isActive = true
//        subjectTextField.heightAnchor.constraint(equalToConstant: 21).isActive = true
//
//        subjectBottomLine.topAnchor.constraint(equalTo: subjectTextField.bottomAnchor, constant: 6).isActive = true
//        subjectBottomLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44).isActive = true
//        subjectBottomLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44).isActive = true
//        subjectBottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
//
//        registrationButton.topAnchor.constraint(equalTo: subjectTextField.bottomAnchor, constant: 168).isActive = true
//        registrationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
//        registrationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
//        registrationButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }
    
    @objc
    func goToNewsScreen(){
        
        guard let nameText = contentView.nameTextField.text, nameText != "" else {
            let alert = UIAlertController(title: "Ой!", message: "Пожалуйста, введите имя или название учреждения", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true)
            print("stop man")
            return
        }

        guard let phoneText = contentView.phoneTextField.text, phoneText != "" else {
            let alert = UIAlertController(title: "Ой!", message: "Пожалуйста, введите телефон", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true)
            print("stop man")
            return
        }
        
        guard let subjectText = contentView.subjectTextField.text, subjectText != "" else {
            let alert = UIAlertController(title: "Ой!", message: "Пожалуйста, введите наименование субъекта", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true)
            print("stop man")
            return
        }
        
        
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
          fatalError("could not get scene delegate ")
        }
        sceneDelegate.reloadApp()
    }
    

}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
