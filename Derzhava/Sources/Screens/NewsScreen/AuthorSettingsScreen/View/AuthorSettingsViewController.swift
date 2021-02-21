//
//  AuthorSettingsViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 25.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit
import RealmSwift

class AuthorSettingsViewController: UIViewController {
    
    let contenView = AuthorSettingsScreenView()
    var people = try! Realm().objects(AddPost.self)
    var realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        
        setNavigationController()
        setTableView()
        
        let path = realm.configuration.fileURL?.path
        print("\nPath: \(String(describing: path))")
    }
    
    override func loadView() {
        view = contenView
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Настройки"
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationController?.navigationBar.backgroundColor = Colors.background

        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = Colors.darkBlue
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(goToUserScreens))
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    @objc
    func goToUserScreens(){
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
          fatalError("could not get scene delegate ")
        }
        sceneDelegate.reloadApp()
    }
    
    func setTableView(){
        contenView.tableview.delegate = self
        contenView.tableview.dataSource = self
        contenView.tableview.register(AuthorSettingsTableViewCell.self, forCellReuseIdentifier: "AuthorSettingsTableViewCell")
        contenView.tableview.register(StatusAndPublicationsTableViewCell.self, forCellReuseIdentifier: "StatusAndPublicationsTableViewCell")
        contenView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
    }
    
}

extension AuthorSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeaderForFullNews") as! MyCustomHeaderForFullNews
        
        switch section {
        case 0:
            return UIView()
        case 1:
            view.title.text = "Ожидают публикации"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 18)
            return view
        case 2:
            view.title.text = "Неоплаченный публикации"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 18)
            return view
        
        default:
            view.title.text = "Оплаченные публикации"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 18)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 0
        case 1:
            return 60
        case 2:
            return 60
        default:
            return 60
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 275
        default:
            return 110
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            print("\nNUMBER OF PEOPLE - \(people.count)")
            return people.count + 1
        case 2:
            return 2

        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cellone = tableView.dequeueReusableCell(withIdentifier: "AuthorSettingsTableViewCell") as? AuthorSettingsTableViewCell else {
            assertionFailure("AuthorSettingsTableViewCell is not available")
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatusAndPublicationsTableViewCell") as? StatusAndPublicationsTableViewCell else {
            assertionFailure("StatusAndPublicationsTableViewCell is not available")
            return UITableViewCell()
        }
        
        switch indexPath.section {

        case 0:
            return cellone
            case 1:
                if indexPath.row == 0{
                    cell.photoImageView.image = UIImage(named: "newspicture")
                    cell.titleLabel.text = "Главные события одиннадцатого дня протестов в Белоруссии"
                    cell.publicationStatusLabel.text = "Выберите время или перебейте цену"
                    cell.publicationStatusLabel.textColor = .red
                    cell.photoImageView.layer.borderColor = UIColor.red.cgColor
                    cell.photoImageView.layer.borderWidth = 1
                    return cell
                } else {
                    cell.publicationStatusLabel.text = "8 000 Р"
                    cell.titleLabel.text = people[indexPath.row - 1].title
                    cell.photoImageView.image = UIImage(data: people[indexPath.row - 1].photo! as Data)
                    print("\nPUBLICATION TEXT IN CELL - \(cell.titleLabel.text ?? "fail with publication text in cell")")
                    return cell
                }

            case 2:
                cell.publicationStatusLabel.text = "7000 Р"
                cell.photoImageView.image = UIImage(named: "newspicture")
                cell.titleLabel.text = "Главные события одиннадцатого дня протестов в Белоруссии"
                return cell
            default:
                cell.publicationStatusLabel.text = "5 000 Р"
                cell.photoImageView.image = UIImage(named: "newspicture")
                cell.titleLabel.text = "Главные события одиннадцатого дня протестов в Белоруссии"
                return cell
            }
            
        }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            print("case 0")
        case 1:
            guard editingStyle == .delete else {return}
            let peopleo = people[indexPath.row - 1]
            deletePerson(peopleo)
        case 2:
            print("case 1")

        default:
            print("case default")
        }
    }
    
    func deletePerson<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
                contenView.tableview.reloadData()
            }
        } catch {
            print("error man")
        }
    }
    
    @objc
    func close(){
        dismiss(animated: true, completion: nil)
    }
    

}

