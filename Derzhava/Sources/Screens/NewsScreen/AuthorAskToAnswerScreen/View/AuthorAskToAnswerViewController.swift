//
//  AuthorAskToAnswerViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 30.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class AuthorAskToAnswerViewController: UIViewController {
    
    let contentView = AuthorAskToAnswerScreenView()
    
//    let tableview:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .singleLine
//        table.isScrollEnabled = true
//        table.allowsSelection = false
//        return table
//    }()
//
//    let headerView:UIView = {
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
////        view.layer.borderWidth = 0.5
////        view.layer.borderColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
//        return view
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemTeal
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        
        setNavigationController()
//        setHeader()
        setTableView()
//        addSubViews()
//        setConstrains()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Просьба ответить"
        navigationItem.largeTitleDisplayMode = .never
//        navigationController?.navigationBar.shadowImage = UIImage(named: "varlamov")

//        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    }
    
//    func addSubViews(){
//        [tableview].forEach{self.view.addSubview($0)}
//    }
//
//    func setConstrains(){
//        tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        tableview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        //tableview.tableHeaderView = headerView
    }
    
//    func setHeader(){
//        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
//    }
    
    func heightForView(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 31, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }

}

extension AuthorAskToAnswerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let fontForTitleLabel = UIFont(name: "SFProDisplay-Semibold", size: 20) else {
            assertionFailure("\nfontForMainText is not available")
            return 0
        }
        
        let heightOfTitleText = heightForView(text: newsArray[indexPath.row].newstitle, font: fontForTitleLabel)
        print("NEWS TITLE HEIGHT - \(heightOfTitleText)")
        
        return 374 + heightOfTitleText + 86
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
            assertionFailure("NewsTableViewCell is not available")
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
        let model = newsArray[indexPath.row]
//        cell.photoImageView.image = newsArray[indexPath.row].photo
//        cell.nameLabel.text = newsArray[indexPath.row].newstitle
//        cell.adressLabel.text = newsArray[indexPath.row].newstext
//        cell.numverOfViews.text = newsArray[indexPath.row].numberofallviews
//        cell.writerLogoImageView.image = newsArray[indexPath.row].logoofwriter
//        cell.bottomOfTheCellLabel.text = newsArray[indexPath.row].signatureofwriter
        
        cell.configure(with: NewsViewModel(with: model))
        cell.bottomOfTheCellLabel.isHidden = false
        cell.askToAnswerButtom.isHidden = false
        return cell
    }
    
    
}
