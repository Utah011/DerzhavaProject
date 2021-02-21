//
//  addPoliticiansViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 10.01.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import UIKit

class AddPoliticiansViewController: UIViewController, UISearchBarDelegate {
    
    let contentView = AddPoliticiansScreenView()
    let searchController = UISearchController(searchResultsController: nil)
    
    var labelArrat = ["Леонид Вологидин","Иван Волкодавский","Анатолий Велин","Владимир Истошев","Леонид Вологидин","Ксения Собчак"]
    
    let imageArray:[UIImage] = [UIImage(named: "varlamov")!,UIImage(named: "polit")!,UIImage(named: "zhirinovskiy")!,UIImage(named: "milonov")!,UIImage(named: "sil")!, UIImage(named: "sobchak")!]
        
    var filteredData: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        filteredData = labelArrat
        
        setNavigationController()
        setTableView()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Подтвердить", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = Colors.darkBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = Colors.black
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.setValue("Назад", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = Colors.darkBlue
        navigationItem.setHidesBackButton(false, animated: true)
    }
    
    @objc
    func close(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func saveButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(ChangeSubjectTableViewCell.self, forCellReuseIdentifier: "ChangeSubjectTableViewCell")
        contentView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
    }
    
    func searchBar(_ searchBar:UISearchBar, textDidChange searchText:String){
        filteredData = []
                
        if searchText == "" {
            filteredData = labelArrat
        } else {
            for subjects in labelArrat {
                if subjects.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(subjects)
                }
            }
        }
        self.contentView.tableview.reloadData()
    }

}

extension AddPoliticiansViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeSubjectTableViewCell") as? ChangeSubjectTableViewCell else {
            assertionFailure("ChangeSubjectTableViewCell is not available")
            return UITableViewCell()
        }
        cell.subjectLabel.text = filteredData[indexPath.row]
        cell.photoImageView.image = imageArray[indexPath.row]
        cell.photoImageView.layer.cornerRadius = 37.5
        cell.photoImageView.contentMode = .scaleAspectFill
        return cell
    }
    
    
}
