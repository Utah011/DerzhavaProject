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
    
//     var nameLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.numberOfLines = 0
//        lbl.textAlignment = .left
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 30)
//        lbl.textColor = .black
//        lbl.lineBreakMode = .byClipping
//        return lbl
//    }()
//
//    let arrowdown:UIImageView = {
//        let img = UIImageView()
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.clipsToBounds = true
//        img.image = UIImage(named: "arrowdown")
//        return img
//    }()
//
//    let headerView:UIView = {
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
//        view.clipsToBounds = true
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
//        return view
//    }()
//
//    let newRequestToReplyImageView:UIImageView = {
//        let view = UIImageView()
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 12.5
//        view.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//        return view
//    }()
//
//    let newRequestToReplyNumberLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.text = "2"
//        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 13)
//        lbl.textColor = .white
//        lbl.textAlignment = .center
//        return lbl
//    }()
//
//    let newRequestToReplyLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.text = "Новых просьбы ответить"
//        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 13)
//        lbl.textColor = .white
//        lbl.textAlignment = .center
//        lbl.textColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//        return lbl
//    }()
//
//
//
//        let firstView:UIView = {
//            let view = UIView()
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//
//        let tableview:UITableView = {
//            let table = UITableView()
//            table.translatesAutoresizingMaskIntoConstraints = false
//            table.separatorStyle = .none
//            table.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
//            return table
//        }()
//
//
//    var con = NSLayoutConstraint()
    
    var finalCity: String?

     
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
            
            exampleFilling()
//            configureModels()
            
            finalCity = "Москва"
            contentView.nameLabel.text = finalCity
            
            setNavigationController()
            
            setTableView()

            
//            navigationController?.setNavigationBarHidden(false, animated: true)
//
//            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "gear"), style: .plain, target: self, action: #selector(didtapButtontoflow))
//
//            navigationController?.navigationBar.shadowImage = UIImage(named: "justlinegray1")
//
//            if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
//                navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Создать новость", style: .plain, target: self, action: #selector(goToMakeNewsScreen))
//                print("YOU ARE IN!")
//            }
//            navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//            navigationItem.rightBarButtonItem?.tintColor = .black
//
//            let backItem = UIBarButtonItem()
//            backItem.title = "Назад"
//
//            navigationItem.backBarButtonItem = backItem
//            navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//
//            let recognizer = UITapGestureRecognizer(target: self, action: #selector(didtapButton))
//            navigationController?.view.addGestureRecognizer(recognizer)
            
            
//            let recognizer = UITapGestureRecognizer(target: self, action: #selector(didtapButton))

//            let recognizerForHeader = UITapGestureRecognizer(target: self, action: #selector(goToAuthorAskToAnswerScreenButton))
//            contentView.headerView.addGestureRecognizer(recognizerForHeader)
            
//            finalCity = "Москва"
//            contentView.nameLabel.text = finalCity
            
//            contentView.firstView.addGestureRecognizer(recognizer)
//            setTableView()
            
//            contentView.tableview.delegate = self
//            contentView.tableview.dataSource = self
//            contentView.tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
            
//            [firstView,tableview].forEach{self.view.addSubview($0)}
//            [nameLabel,arrowdown].forEach{self.firstView.addSubview($0)}
//            [newRequestToReplyImageView,newRequestToReplyNumberLabel,newRequestToReplyLabel].forEach{self.headerView.addSubview($0)}
//
//            setConstraints()
            
//            if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
//                contentView.setHeader()
//                contentView.tableview.tableHeaderView = contentView.headerView
//                print("YOU ARE IN!")
//            }
        }
    
    override func loadView() {
        view = contentView
    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
    }
    
//    func configureModels(){
//        for i in 1...9{
//            let salon = News(newstitle: "Состояние Трампа внушает большое беспокойство", newstext: "Имущество фирмы составляют основные и оборотные средства, а также иные ценности, стоимость которых отражается на самостоятельном балансе предприятия и формируется из собственных и заемных средств. Финансовые ресурсы предприятия формируются за счет прибыли от его деятельности. Имущество фирмы составляют основные и оборотные средства, а также иные ценности, стоимость которых отражается на самостоятельном балансе предприятия и формируется из собственных и заемных средств. Финансовые ресурсы предприятия формируются за счет прибыли от его деятельности. которых отражается на самостоятельном балансе предприятия и формируется из собственных и заемных средств. Финансовые ресурсы предприятия формируются за счет прибыли от его деятельности.", id: 1, photo: UIImage(named: "newspicture")!, logoofwriter: UIImage(named: "riabiglogo")!, numberofallviews: "137k", signatureofwriter: "РИА • 12:00")
//            models.append(salon)
//        }
//    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "gear"), style: .plain, target: self, action: #selector(didtapButtontoflow))
        
        navigationController?.navigationBar.shadowImage = UIImage(named: "justlinegray1")
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Создать новость", style: .plain, target: self, action: #selector(goToMakeNewsScreen))
            print("YOU ARE IN!")
        }
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didtapButton))
//        navigationController?.view.addGestureRecognizer(recognizer)
        
        let recognizerForHeader = UITapGestureRecognizer(target: self, action: #selector(goToAuthorAskToAnswerScreenButton))
        contentView.headerView.addGestureRecognizer(recognizerForHeader)
        
        contentView.firstView.addGestureRecognizer(recognizer)

    }
    
    
//    func setHeader(){
//        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
//        newRequestToReplyImageView.frame = CGRect(x: 75, y: 13.5, width: 25, height: 25)
//        newRequestToReplyNumberLabel.frame = CGRect(x: 77, y: 15, width: 21, height: 21)
//        newRequestToReplyLabel.frame = CGRect(x: 101, y: 15, width: 205, height: 22)
//    }
    
    
//    @objc
//    func changeColor(){
//        view.backgroundColor = .green
//        print("CHANGE THE COLOR PLEASE")
//    }
    
//    @objc
//    func hideNavController(){
//        navigationController?.hidesBarsOnTap = true
//    }
    
//    func addTopAndBottomBorders() {
//        let thickness: CGFloat = 0.5
//       let topBorder = CALayer()
//       let bottomBorder = CALayer()
//       topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.firstView.frame.size.width, height: thickness)
//       topBorder.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
//       bottomBorder.frame = CGRect(x:0, y: self.firstView.frame.size.height - thickness, width: self.firstView.frame.size.width, height:thickness)
//       bottomBorder.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
//       //firstView.layer.addSublayer(topBorder)
//       firstView.layer.addSublayer(bottomBorder)
//    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
        
//        private func setConstraints(){
//
//            let con = firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 88)
//            con.isActive = true
//            firstView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//            firstView.heightAnchor.constraint(equalToConstant: 49).isActive = true
//
//            nameLabel.centerYAnchor.constraint(equalTo: firstView.centerYAnchor).isActive = true
//            nameLabel.leftAnchor.constraint(equalTo: firstView.leftAnchor,constant: 16).isActive = true
//
//            arrowdown.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 23).isActive = true
//            arrowdown.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 7).isActive = true
//            arrowdown.widthAnchor.constraint(equalToConstant: 18).isActive = true
//            arrowdown.heightAnchor.constraint(equalToConstant: 10).isActive = true
//
//            tableview.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 0).isActive = true
//            tableview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//            tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        }
    
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
//        self.navigationController?.pushViewController(defaultVC, animated: true)
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
//            cell.photoImageView.image = newsArray[indexPath.row].photo
//            cell.nameLabel.text = newsArray[indexPath.row].newstitle
//            cell.adressLabel.text = newsArray[indexPath.row].newstext
//            cell.numverOfViews.text = newsArray[indexPath.row].numberofallviews
//            cell.writerLogoImageView.image = newsArray[indexPath.row].logoofwriter
//            cell.bottomOfTheCellLabel.text = newsArray[indexPath.row].signatureofwriter
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
                //navigationController?.navigationBar.backgroundColor = .red
                
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
                //navigationController?.navigationBar.backgroundColor = .green
                
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

