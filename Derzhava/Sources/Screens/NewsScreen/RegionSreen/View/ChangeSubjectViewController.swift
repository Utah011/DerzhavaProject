//
//  ChangeSubjectViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 03.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class ChangeSubjectViewController: UIViewController, UISearchBarDelegate {
    
    let contentView = ChangeSubjectScreenView()
    let searchController = UISearchController(searchResultsController: nil)
    public var completion: ((String?) -> Void)?
    
//    let FlowVC = FlowViewController()

    
//    let myScrollView:UIScrollView = {
//        let scrl = UIScrollView()
//        scrl.translatesAutoresizingMaskIntoConstraints = false
//        return scrl
//    }()
    
    
    var arrayOfTwoObjects = ["Российская Федерация","Москва"]
    
    var filteredData: [String]!
    var filteredDataOfTwoSubjects: [String]!

    
//    let tableview:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .singleLine
//        return table
//    }()
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setNavigationController()
        setSearchController()
        setTableView()
        
        filteredData = regionsTextArray
        filteredDataOfTwoSubjects = arrayOfTwoObjects
        
//        navigationItem.title = "Выбор субъекта"
//        navigationItem.largeTitleDisplayMode = .never
//        navigationItem.searchController = searchController
//        searchController.searchBar.delegate = self
//        navigationItem.setHidesBackButton(false, animated: true)
        
//        [tableview].forEach{self.view.addSubview($0)}
//        contentView.tableview.delegate = self
//        contentView.tableview.dataSource = self
//        contentView.tableview.register(ChangeSubjectTableViewCell.self, forCellReuseIdentifier: "ChangeSubjectTableViewCell")
//        contentView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
//        contentView.tableview.rowHeight = 115
        
//        searchController.searchBar.showsCancelButton = false
//        searchController.searchBar.placeholder = "Поиск"
        
        print(contentView.tableview.rowHeight)
        print(filteredData.count)
        print(CGFloat(filteredData.count))
        print(contentView.tableview.rowHeight * CGFloat(filteredData.count))
//        setConstraint()
        

      }
    
//    @objc
//    func changeColor(){
//        view.backgroundColor = .systemTeal
//        print("HAY CHANGE SUBJECT")
//    }
    
    override func loadView() {
        view = contentView
    }
    
    func setNavigationController(){
        navigationItem.title = "Выбор субъекта"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.setHidesBackButton(false, animated: true)
    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(ChangeSubjectTableViewCell.self, forCellReuseIdentifier: "ChangeSubjectTableViewCell")
        contentView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
        contentView.tableview.rowHeight = 115
    }
    
    func setSearchController(){
        searchController.searchBar.showsCancelButton = false
        searchController.searchBar.placeholder = "Поиск"
    }
    
    func searchBar(_ searchBar:UISearchBar, textDidChange searchText:String){
        filteredData = []
                
        if searchText == "" {
            filteredData = regionsTextArray
        } else {
            for subjects in regionsTextArray {
                if subjects.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(subjects)
                }
            }
        }
        self.contentView.tableview.reloadData()
    }
    
//    func setConstraint(){
//        tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        tableview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }

}

extension ChangeSubjectViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeaderForFullNews") as! MyCustomHeaderForFullNews
        
        switch section {
        case 0:
            view.title.text = "Предложения"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            return view
        default:
            view.title.text = "Выбрать свой регион"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 60
        default:
            return 60
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return filteredData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeSubjectTableViewCell") as? ChangeSubjectTableViewCell else {
            assertionFailure("ChangeSubjectTableViewCell is not available")
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.subjectLabel.text = arrayOfTwoObjects[indexPath.row]
            cell.photoImageView.image = subjectOffersArray[indexPath.row]
            return cell
        default:
            cell.subjectLabel.text = filteredData[indexPath.row]
            cell.photoImageView.image = regionsImageArray[indexPath.row]
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let defaultVC = NewsViewController()
        
        switch indexPath.section {
        case 0:
            print("\nMan nooo")
            completion!(filteredDataOfTwoSubjects[indexPath.row])
        default:
            completion!(filteredData[indexPath.row])
        }
        
        navigationController?.popToRootViewController(animated: true)
            
        }
    }

