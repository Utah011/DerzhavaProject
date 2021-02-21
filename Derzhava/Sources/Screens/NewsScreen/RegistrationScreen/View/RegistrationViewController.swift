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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        
        setNavigationController()
        setContentView()
        textFieldSettings()
        
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
