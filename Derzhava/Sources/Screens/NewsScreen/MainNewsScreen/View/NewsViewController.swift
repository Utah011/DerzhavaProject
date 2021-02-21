//
//  ViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 02.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var models = [News]()
    let contentView = NewsScreenView()
    var lastContentOffset: CGFloat = 0
    var finalCity: String?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = Colors.background
            
            exampleFilling()
            
            finalCity = "Москва"
            contentView.nameLabel.text = finalCity
            
            setNavigationController()
            
            setTableView()
        }
    
    override func loadView() {
        view = contentView
    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "gear"), style: .plain, target: self, action: #selector(didtapButtontoflow))
        
        navigationController?.navigationBar.shadowImage = UIImage(named: "justlinegray1")
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Создать новость", style: .plain, target: self, action: #selector(goToMakeNewsScreen))
            print("YOU ARE IN!")
        }
        navigationItem.leftBarButtonItem?.tintColor = Colors.darkBlue
        navigationItem.rightBarButtonItem?.tintColor = Colors.black
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = Colors.darkBlue
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didtapButton))
        
        let recognizerForHeader = UITapGestureRecognizer(target: self, action: #selector(goToAuthorAskToAnswerScreenButton))
        contentView.headerView.addGestureRecognizer(recognizerForHeader)
        contentView.firstView.addGestureRecognizer(recognizer)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func findOutLabelLength() -> CGFloat{
        var a: CGFloat = 0
        a = contentView.nameLabel.intrinsicContentSize.width
        print("This is text lenght \(a)")
        return a
    }
    
    @objc
    func didtapButton() {
        let defaulVC = ChangeSubjectViewController()
                
        defaulVC.completion = { [weak self] text in
            self?.finalCity = text ?? "\nOH NO MAN"
            self?.contentView.nameLabel.text = self?.finalCity
            
            
            print("\nNumber or letters in the word is - \(self?.contentView.nameLabel.text?.count ?? 0)")
            let numberOfLetters = self?.contentView.nameLabel.text?.count ?? 0
            
            if numberOfLetters == 6{
                print("\nYEEEEEA MAAAAN")
                self?.contentView.nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 30)
            }
            
            if numberOfLetters <= 12 && numberOfLetters != 6 {
                print("\nYEEEEEA MAAAAN")
                self?.contentView.nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 27)
            }
            
            if numberOfLetters > 12 && numberOfLetters <= 21 {
                self?.contentView.nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
            }
            
            if numberOfLetters > 21 && numberOfLetters <= 23 {
                self?.contentView.nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 21)
            }
            
            if numberOfLetters > 23 {
                self?.contentView.nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 15)
            }
            
            
        }
        self.navigationController?.pushViewController(defaulVC, animated: true)
    }
    
    @objc
    func didtapButtontoflow() {
        let defaultVC = SettingsViewController()
        let defaultVCSecond = AuthorSettingsViewController()
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            self.navigationController?.pushViewController(defaultVCSecond, animated: true)
        } else {
            self.navigationController?.pushViewController(defaultVC, animated: true)
        }
    }
    
    @objc
    func goToAuthorAskToAnswerScreenButton() {
        let defaulVC = AuthorAskToAnswerViewController()
        self.navigationController?.pushViewController(defaulVC, animated: true)
    }
    
    @objc
    func goToMakeNewsScreen(){
        let editingVC = MakeNewsViewController()
        self.navigationController?.pushViewController(editingVC, animated: true)
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

    extension NewsViewController:UITableViewDataSource, UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            guard let fontForTitleLabel = UIFont(name: "SFProDisplay-Semibold", size: 20) else {
                assertionFailure("\nfontForMainText is not available")
                return 0
            }
            
            let heightOfTitleText = heightForView(text: newsArray[indexPath.row].newstitle, font: fontForTitleLabel)
            print("NEWS TITLE HEIGHT - \(heightOfTitleText)")
            
            if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
                if (indexPath.row % 2 == 0) && (indexPath.row != 0) {
                    return 374 + heightOfTitleText + 86
                } else {
                    return 374 + heightOfTitleText + 58
                }
            } else {
                return 374 + heightOfTitleText + 58
            }
            
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newsArray.count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
                assertionFailure("NewsTableViewCell is not available")
                return UITableViewCell()
            }
            let model = newsArray[indexPath.row]
            
            cell.selectionStyle = .none
            cell.configure(with: NewsViewModel(with: model))
            
            
            if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
                if (indexPath.row % 2 == 0) && (indexPath.row != 0){
                    cell.bottomOfTheCellLabel.isHidden = false
                    cell.askToAnswerButtom.isHidden = false
                } else {
                    cell.bottomOfTheCellLabel.isHidden = false
                    cell.askToAnswerButtom.isHidden = true
                }
                print("YOU ARE IN!")
            } else {
                cell.bottomOfTheCellLabel.isHidden = false
                cell.askToAnswerButtom.isHidden = true
            }
            

            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let defaulVC = FullNewsViewController()
            self.navigationController?.pushViewController(defaulVC, animated: true)
        }


        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if self.lastContentOffset < scrollView.contentOffset.y {
                // did move up
                print("\nMOVE DOWN")
                contentView.con.isActive = false
                contentView.con = contentView.firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
                contentView.con.isActive = true
                
                UIView.animate(withDuration: 0.01, delay: 0, options: .curveEaseIn, animations: {
                    print("Hide")
                    self.navigationController?.setNavigationBarHidden(true, animated: true)
                }, completion: nil)
                
            } else if self.lastContentOffset > scrollView.contentOffset.y {
                // did move down
                print("\nMOVE UP")                
                contentView.con.isActive = false
                contentView.con = contentView.firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 88)
                contentView.self.con.isActive = true
                
                UIView.animate(withDuration: 0.18, delay: 0, options: .curveEaseIn, animations: {
                    print("Hide")
                    self.navigationController?.setNavigationBarHidden(false, animated: true)
                }, completion: nil)

            } else {
                // didn't move
                print("\nDON'T MOOOOVE")
            }
        }

    }

