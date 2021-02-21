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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        setNavigationController()
        contentView.buttonRegistration.addTarget(self, action: #selector(goToRegistration), for: .touchUpInside)
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
        navigationItem.backBarButtonItem?.tintColor = Colors.darkBlue
    }
    
    @objc
    func goToRegistration(){
        let defaulVC = RegistrationViewController()
        self.navigationController?.pushViewController(defaulVC, animated: true)
    }

}
