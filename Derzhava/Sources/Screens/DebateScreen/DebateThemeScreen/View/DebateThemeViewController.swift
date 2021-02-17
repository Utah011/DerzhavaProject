//
//  DebateThemeViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 04.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import UIKit

class DebateThemeViewController: UIViewController, UISearchBarDelegate {
    
    let contentView = DebateThemeScreenView()
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredData: [String]!
    
//    let tableview:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .singleLine
//        return table
//    }()
//
//    let myHeaderView:UIView = {
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
//        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 78)
//        return view
//    }()
//
//    let myHeaderTitle:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Тема"
//        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 22)
//        return lbl
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        filteredData = themesForDebate
        
        setNavigationController()
        setTableView()
//        addSubviews()
//        setConstrains()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Подтвердить", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
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
    
    func searchBar(_ searchBar:UISearchBar, textDidChange searchText:String){
        filteredData = []
                
        if searchText == "" {
            filteredData = themesForDebate
        } else {
            for subjects in themesForDebate {
                if subjects.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(subjects)
                }
            }
        }
        self.contentView.tableview.reloadData()
    }
    
//    func addSubviews(){
//        [tableview].forEach{self.view.addSubview($0)}
//        myHeaderView.addSubview(myHeaderTitle)
//    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(DebateThemeCell.self, forCellReuseIdentifier: "DebateThemeCell")
        contentView.tableview.tableHeaderView = contentView.myHeaderView
    }
//
//    func setConstrains(){
//        tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        tableview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//
//        myHeaderTitle.topAnchor.constraint(equalTo: myHeaderView.topAnchor, constant: 30).isActive = true
//        myHeaderTitle.leftAnchor.constraint(equalTo: myHeaderView.leftAnchor, constant: 16).isActive = true
//    }

}

extension DebateThemeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DebateThemeCell") as? DebateThemeCell else {
            assertionFailure("DebateThemeCell is not available")
            return UITableViewCell()
        }
        
        cell.themeLabel.text = filteredData[indexPath.row]
        
        return cell
    }
    
    
}
