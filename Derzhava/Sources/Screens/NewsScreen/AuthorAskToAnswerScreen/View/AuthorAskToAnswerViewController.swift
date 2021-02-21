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
        navigationItem.title = "Просьба ответить"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
    }
    
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
        
        cell.configure(with: NewsViewModel(with: model))
        cell.bottomOfTheCellLabel.isHidden = false
        cell.askToAnswerButtom.isHidden = false
        return cell
    }
    
    
}
