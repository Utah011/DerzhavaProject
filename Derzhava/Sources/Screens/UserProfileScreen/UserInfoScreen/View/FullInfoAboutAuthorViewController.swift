//
//  FullInfoAboutAuthorViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 27.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class FullInfoAboutAuthorViewController: UIViewController {
    
    let contentView = UserInfoScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        
        settingsNavigationController()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func settingsNavigationController() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Информация"
    }

}
