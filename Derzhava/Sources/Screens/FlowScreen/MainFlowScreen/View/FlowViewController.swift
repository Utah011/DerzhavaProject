//
//  SearchViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 02.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class FlowViewController: UIViewController, UISearchBarDelegate, CellWithCollectionViewDelegate {
    func didSelectIndex(_ indexPath: IndexPath) {
        let defaulVC = FullEternalQuestionViewController()
        navigationController!.pushViewController(defaulVC, animated: true)
    }
    
    let contentView = FlowScreenView()
    let searchController = UISearchController(searchResultsController: nil)
    
//    let recognizer = UITapGestureRecognizer(target: self, action: #selector(goToFullEternalQuestions))

//    let tableview:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
//        table.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
//        return table
//    }()
//
//    let nc = NotificationCenter.default

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        setNavigationController()
        setTableView()
//        addSubviews()
//        setConstrains()
    }
    
    @objc
    func changeColor(){
        view.backgroundColor = .systemPink
        print("HAY CHANGE FLOW")

    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Поток"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.showsCancelButton = false
        searchController.searchBar.placeholder = "Поиск"
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Создать твит", style: .plain, target: self, action: #selector(goToMakeATwitScreen))
            print("YOU ARE IN!")
        }
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
    }
    
    override func loadView() {
        view = contentView
    }
    
    @objc
    func goToMakeATwitScreen(){
        let defaulVC = MakeATwitViewController()
        self.navigationController?.pushViewController(defaulVC, animated: true)
    }

    
    @objc
    func nothingHere(){
        
    }
    
//    func addSubviews(){
//        [tableview].forEach{self.view.addSubview($0)}
//    }
//
//    func setConstrains(){
//        tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        tableview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(FlowTableViewCell.self, forCellReuseIdentifier: "FlowTableViewCell")
        contentView.tableview.register(PositionTableViewCell.self, forCellReuseIdentifier: "PositionTableViewCell")
        contentView.tableview.register(TwitsCell.self, forCellReuseIdentifier: "TwitsCell")
        contentView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
    }
    
    func heightForView(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 75, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let defaulVC = SearchViewController()
        navigationController?.pushViewController(defaulVC, animated: true)
        searchController.searchBar.setShowsCancelButton(false, animated: true)
        return false
      }
    
    @objc
    func goToEternalQuestions(){
        let defaulVC = EternalQuestionsViewController()
        print("YOU MUST GO")
        navigationController?.pushViewController(defaulVC, animated: true)
    }
}

extension FlowViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeaderForFullNews") as! MyCustomHeaderForFullNews
        
        switch section {
        case 0:
            view.title.text = "Вечные вопросы"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            view.buttonImage.isHidden = false
            view.buttonImage.setImage(UIImage(named: "arrowright"), for: .normal)
            view.buttonImage.addTarget(self, action: #selector(goToEternalQuestions), for: .touchUpInside)
            return view
        default:
            view.title.text = "Активность"
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
            let fontForTitleLabel = UIFont(name: "SFProDisplay-Semibold", size: 15) ?? UIFont()
            let fontForMainTextLabel = UIFont(name: "SFProText-Regular", size: 13) ?? UIFont()
            
            let heightForTitle = heightForView(text: eternalQuestionsArray[indexPath.row].title, font: fontForTitleLabel)
            let heghtForMainText = heightForView(text: eternalQuestionsArray[indexPath.row].maintext, font: fontForMainTextLabel)
            
            print("THIS IS HEIGHT FOR TITLE - \(heightForTitle)")
            print("THIS IS HEIGHT FOR MAIN TEXT - \(heghtForMainText)")
            
            return 195 + heightForTitle + heghtForMainText
        default:
            if indexPath.row == 0 || indexPath.row == 3{
                return 680
            } else {
                return 430
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 6
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlowTableViewCell") as? FlowTableViewCell else {
                assertionFailure("FlowTableViewCell is not available")
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        default:
            if indexPath.row == 0 || indexPath.row == 3 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PositionTableViewCell") as? PositionTableViewCell else {
                    assertionFailure("PositionTableViewCell is not available")
                    return UITableViewCell()
                }
                cell.photoImageView.image = answersArray[indexPath.row].photo
                cell.nameLabel.text = answersArray[indexPath.row].namesurname
                
//                cell.secondPhotoImageView.image = answersArray[indexPath.row].photo
//                cell.secondNameLabel.text = answersArray[indexPath.row].namesurname
                cell.secondPhotoImageView.image = UIImage(named: "kud")
                cell.secondNameLabel.text = "Алексей Кудрин"
                
                cell.mainTextLabel.text = answersArray[indexPath.row].maintext
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwitsCell") as? TwitsCell else {
                    assertionFailure("TwitsCell is not available")
                    return UITableViewCell()
                }
                cell.photoImageView.image = answersArray[indexPath.row].photo
                cell.nameLabel.text = answersArray[indexPath.row].namesurname
                cell.newsImageView.image = newsArray[indexPath.row].photo
                return cell
            }
        }
        
    }
    
    
}

//if indexPath.row % 2 == 0

