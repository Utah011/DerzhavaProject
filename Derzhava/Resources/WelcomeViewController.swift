//
//  WelcomeViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 10.01.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

//import UIKit
//
//class WelcomeViewController: UIViewController {
//
//    let button = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemPurple
//        setNavigationController()
//
//        button.backgroundColor = .red
//        view.addSubview(button)
//        button.frame = CGRect(x: 50, y: 150, width: 50, height: 50)
//        button.addTarget(self, action: #selector(didtapButton), for: .touchUpInside)
//
//    }
//
//    func setNavigationController(){
//        navigationController?.setNavigationBarHidden(false, animated: true)
//        let backItem = UIBarButtonItem()
//        backItem.title = "Назад"
//        navigationItem.backBarButtonItem = backItem
//        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//
//    }
//
//    @objc
//    func didtapButton() {
//        let defaulVC = NewsViewController()
//        self.navigationController?.pushViewController(defaulVC, animated: true)
//    }
//
//
//}
