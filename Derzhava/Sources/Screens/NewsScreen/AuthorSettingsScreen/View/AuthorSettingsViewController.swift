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

    
//    let tableview:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
//        table.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        return table
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        
        setNavigationController()
        setTableView()
//        addSubViews()
//        setConstrains()
        
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
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)

        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        
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
    
//    func addSubViews(){
//        [tableview].forEach{self.view.addSubview($0)}
//    }
    
    func setTableView(){
        contenView.tableview.delegate = self
        contenView.tableview.dataSource = self
        contenView.tableview.register(AuthorSettingsTableViewCell.self, forCellReuseIdentifier: "AuthorSettingsTableViewCell")
        contenView.tableview.register(StatusAndPublicationsTableViewCell.self, forCellReuseIdentifier: "StatusAndPublicationsTableViewCell")
        contenView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
    }
    
//    func setConstrains(){
//        tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        tableview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }
    
}

extension AuthorSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeaderForFullNews") as! MyCustomHeaderForFullNews
        
        switch section {
        case 0:
            return UIView()
        case 1:
//            view.title.text = "Неоплаченный публикации"
//            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 18)
//            return view
            
//            if realm.isEmpty {
//                print("Realm is empty for header")
//            } else {
//                view.title.text = "Ожидают публикации"
//                view.title.font = UIFont(name: "SFProDisplay-Bold", size: 18)
//            }
            view.title.text = "Ожидают публикации"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 18)
            return view
        case 2:
            
//            if realm.isEmpty {
//                print("Realm is empty for header")
//            } else {
//                view.title.text = "Ожидают публикации"
//                view.title.font = UIFont(name: "SFProDisplay-Bold", size: 18)
//            }
//            return view
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
            
//            if realm.isEmpty {
//                return 0
//            } else {
//                return 60
//            }
        case 2:
//            if realm.isEmpty {
//                return 0
//            } else {
//                return 60
//            }
        
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
//            return 2
            print("\nNUMBER OF PEOPLE - \(people.count)")
            return people.count + 1
        case 2:
//            print("\nNUMBER OF PEOPLE - \(people.count)")
//            return people.count
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
//                cell.publicationStatusLabel.text = "Ждет публикации"
//                cell.photoImageView.image = UIImage(named: "newspicture")
//                cell.titleLabel.text = "Главные события одиннадцатого дня протестов в Белоруссии"
//                return cell
                
                
                if indexPath.row == 0{
//                    cell.publicationStatusLabel.text = "Ждет публикации"
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
//                cell.publicationStatusLabel.text = "8 000 Р"
//                cell.titleLabel.text = people[indexPath.row].title
//                cell.photoImageView.image = UIImage(data: people[indexPath.row].photo! as Data)
//                print("\nPUBLICATION TEXT IN CELL - \(cell.titleLabel.text)")
//                return cell
                
                
                
            case 2:
//                cell.publicationStatusLabel.text = "8 000 Р"
//                cell.titleLabel.text = people[indexPath.row].title
//                cell.photoImageView.image = UIImage(data: people[indexPath.row].photo! as Data)
//                print("\nPUBLICATION TEXT IN CELL - \(cell.titleLabel.text)")
//                return cell
                
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
//            print("case 1")
            guard editingStyle == .delete else {return}
            let peopleo = people[indexPath.row - 1]
            deletePerson(peopleo)
        case 2:
//            guard editingStyle == .delete else {return}
//            let peopleo = people[indexPath.row]
//            deletePerson(peopleo)
            
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.section {
//        case 0:
//            print("case 0")
//        case 1:
////            print("case 1")
//            
//            let defaultVC = MakeNewsViewController()
//            self.navigationController?.pushViewController(defaultVC, animated: true)
//        case 2:
////            let defaultVC = MakeNewsViewController()
////            self.navigationController?.pushViewController(defaultVC, animated: true)
//            print("case 1")
//
//        default:
//            print("default select")
//        }
//    }
    
    @objc
    func close(){
        dismiss(animated: true, completion: nil)
    }
    

}

