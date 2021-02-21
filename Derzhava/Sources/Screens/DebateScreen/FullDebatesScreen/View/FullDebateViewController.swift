//
//  FullDebateViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 30.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class FullDebateViewController: UIViewController {
    
    let contentView = FullDebateScreenView()
    var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        
        exampleAnswers()
        setNavigationController()
        setTableView()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didtapButton))
        contentView.myViewHeader.addGestureRecognizer(recognizer)
        print("\nnavig HEIGHT \(view.frame.height)")
        print("\nnavig second HEIGHT \(view.bounds.height)")

        let scrollToTopRecognizaer = UITapGestureRecognizer(target: self, action: #selector(scrollToTopOfView))
        contentView.pinnedView.addGestureRecognizer(scrollToTopRecognizaer)
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            print("YOU ARE IN!")
        }

    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        flag = 1
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc
    func scrollToTopOfView(){
        contentView.tableViewMain.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
        print("\nMust scroll to top")
    }
    
    @objc
    func didtapButton(){
        print("fjnwnfowenfpwepifwpefweifjwefjpefjpwfjef")
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Дебаты"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Подписаться", style: .plain, target: self, action: #selector(nothingHere))
        navigationItem.rightBarButtonItem?.tintColor = Colors.darkBlue
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = Colors.darkBlue

    }
    
    @objc
    func nothingHere(){
        
    }
    
    func setTableView(){
        contentView.tableViewMain.delegate = self
        contentView.tableViewMain.dataSource = self
        contentView.tableViewMain.register(FirstFullTableViewCell.self, forCellReuseIdentifier: "FirstFullTableViewCell")
        contentView.tableViewMain.register(MyCustomSearchFooterForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomSearchFooterForFullNews")
        
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            print("YOU ARE IN!")
        } else {
            contentView.tableViewMain.tableFooterView = contentView.myFooterView
        }
        
        
        contentView.tableViewMain.tableHeaderView = contentView.myViewHeader
        
    }
    
    func heightForView(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 83, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    
}

extension FullDebateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomSearchFooterForFullNews") as! MyCustomSearchFooterForFullNews

        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            return view
        } else {
            return UIView()
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {


            return 60

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let fontForMainText = UIFont(name: "SFProText-Regular", size: 17) else {
            assertionFailure("\nfontForMainText is not available")
            return 0
        }
        
        let heightOfTheMainText = heightForView(text: answersArray[indexPath.row].maintext, font: fontForMainText)
        let heightOfTheSecondMainText = heightForView(text: secondAnswersArray[indexPath.row].maintext, font: fontForMainText)
        print("\nIT'S FIRST - \(heightOfTheMainText)")
        print("\nIT'S SECOND - \(heightOfTheSecondMainText)")
        
        var a:CGFloat = 0
        
        switch indexPath.row % 2 {
        case 0:
            a = 100 + heightOfTheMainText
            print("MY FIRST RESULT - \(a)")
            return a
        default:
            a = 100 + heightOfTheSecondMainText
            print("MY SECOND RESULT - \(a)")
            return a
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstFullTableViewCell") as? FirstFullTableViewCell else {
            assertionFailure("FirstFullTableViewCell is not available")
            return UITableViewCell()
        }
        
        if indexPath.row % 2 == 0{
            cell.photoImageView.setImage(UIImage(named: "polit"), for: .normal)
            cell.nameLabel.text = "Денис Мантуров"
            cell.adressLabel.text = "Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник, Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали. Последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник, Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали."
        } else {
            cell.photoImageView.setImage(UIImage(named: "zhirinovskiy"), for: .normal)
            cell.nameLabel.text = "Владимир Жириновский"
            cell.adressLabel.text = "Ещё одна проблема Конституции — сверхбольшие полномочия президента. Они больше, чем были у генсека и царя. Конституция фактически допускает скрытую форму монархии. Президент всё время может оставлять преемников и, пользуясь огромной властью, обеспечивать им победу на выборах. Ещё одна проблема Конституции — сверхбольшие полномочия президента. Они больше, чем были у генсека и царя. Конституция фактически допускает скрытую форму монархии. Президент всё время может оставлять преемников."
        }
        contentView.pinnedTitleLabel.text = answersArray[indexPath.startIndex].maintext
        
        cell.delegate = self
        cell.index = indexPath
        return cell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset + 300 < scrollView.contentOffset.y {
            // did move up
            print("\nMOVE DOWN")
            contentView.pinnedView.isHidden = false
            
        } else if self.lastContentOffset + 265 > scrollView.contentOffset.y {
            // did move down
            print("\nMOVE UP")
            contentView.pinnedView.isHidden = true

        } else {
            // didn't move
            print("\nDON'T MOOOOVE")
        }
    }
    
}

extension FullDebateViewController: FullDebateTableViewProtocol {
    func goToUser(index: Int) {
        let vc = FullInformationAboutUserViewController()
        print("tap \(index)!")
        navigationController?.pushViewController(vc, animated: true)
    }
}
