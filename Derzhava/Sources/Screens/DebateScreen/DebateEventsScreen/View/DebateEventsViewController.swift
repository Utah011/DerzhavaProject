//
//  DebateEventsViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 28.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class DebateEventsViewController: UIViewController {
    
    let contentView = DebateEventsScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background

        setNavigationController()
        setTableView()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "События"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(AuthorDebateTableViewCell.self, forCellReuseIdentifier: "AuthorDebateTableViewCell")
        contentView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
    }
}

extension DebateEventsViewController: UITableViewDelegate, UITableViewDataSource {
    
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeaderForFullNews") as! MyCustomHeaderForFullNews
            
            switch section {
            case 0:
                view.title.text = "Вызовы"
                view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
                return view
            default:
                view.title.text = "Я вызвал"
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 248
        default:
            return 225
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        default:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorDebateTableViewCell") as? AuthorDebateTableViewCell else {
            assertionFailure("AuthorDebateTableViewCell is not available")
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.newCallButtom.isHidden = false
        default:
            cell.newCallButtom.isHidden = true
        }
        
        return cell
    }
    
    
}
