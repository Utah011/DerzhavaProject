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
    
    var arrayOfTwoObjects = ["Российская Федерация","Москва"]
    
    var filteredData: [String]!
    var filteredDataOfTwoSubjects: [String]!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
        setSearchController()
        setTableView()
        
        filteredData = regionsTextArray
        filteredDataOfTwoSubjects = arrayOfTwoObjects
        
        print(contentView.tableview.rowHeight)
        print(filteredData.count)
        print(CGFloat(filteredData.count))
        print(contentView.tableview.rowHeight * CGFloat(filteredData.count))
      }
    
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

