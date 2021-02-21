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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        filteredData = themesForDebate
        
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
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(DebateThemeCell.self, forCellReuseIdentifier: "DebateThemeCell")
        contentView.tableview.tableHeaderView = contentView.myHeaderView
    }

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
