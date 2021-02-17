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
    
//    let tableViewMain:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .singleLine
//        table.isScrollEnabled = true
//        table.allowsSelection = false
//        return table
//    }()
//
//    let pinnedView:UIView = {
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 0.94)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        view.layer.borderWidth = 1
//        return view
//    }()
//
//    let lineView: UIView = {
//       let v = UIView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//        return v
//    }()
//
//    let pinnedStartLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.numberOfLines = 1
//        lbl.text = "Начало дебатов"
//        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 11)
//        lbl.textAlignment = .left
//        lbl.textColor = .black
//        return lbl
//    }()
//
//    let pinnedTitleLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.numberOfLines = 1
//        //lbl.text = "Начало дебатов"
//        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
//        lbl.textAlignment = .left
//        lbl.textColor = .black
//        lbl.lineBreakMode = .byTruncatingTail
//        return lbl
//    }()
//
//    let myFooterView:UIView = {
//        let view = UIView()
//        //view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .clear
//        view.frame = CGRect(x: 0, y: 0, width: 100, height: 103)
//        view.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
//        view.layer.borderWidth = 0.5
//        return view
//    }()
//
//    let footerTextLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Выборы"
//        lbl.font = UIFont(name: "SFProText-Regular", size: 15)
//        lbl.textAlignment = .center
//        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
//        return lbl
//    }()
//
//    let footerNumberOfViewLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "547 тысяч просмотров"
//        lbl.font = UIFont(name: "SFProText-Regular", size: 15)
//        lbl.textAlignment = .center
//        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
//        return lbl
//    }()
//
//    let myViewHeader:UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//        view.frame = CGRect(x: 0, y: 0, width: 100, height: 220)
//        return view
//    }()
//
//    let headerTextLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.numberOfLines = 2
//        lbl.text = "Выборы в Московскую государственную думу"
//        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 22)
//        lbl.textAlignment = .center
//        lbl.textColor = .black
//        return lbl
//    }()
//
//    let headerTheme:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Тема: Выборы"
//        lbl.font = UIFont(name: "SFProText-Regular", size: 15)
//        lbl.textAlignment = .center
//        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
//        return lbl
//    }()
//
//    let headerCaller:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Вызвал: Денис Мантуров"
//        lbl.font = UIFont(name: "SFProText-Regular", size: 15)
//        lbl.textAlignment = .center
//        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
//        return lbl
//    }()
//
//    let headerCallee:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Вызываемый: Владимир Жириновский"
//        lbl.font = UIFont(name: "SFProText-Regular", size: 15)
//        lbl.textAlignment = .center
//        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
//        return lbl
//    }()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        
        exampleAnswers()
        setNavigationController()
//        addSubViews()
        setTableView()
//        setConstrains()
//        setPinnedViewConstrains()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didtapButton))
        contentView.myViewHeader.addGestureRecognizer(recognizer)
        print("\nnavig HEIGHT \(view.frame.height)")
        print("\nnavig second HEIGHT \(view.bounds.height)")
        //pinnedView.frame = CGRect(x: 0, y: 0 + (navigationController?.navigationBar.frame.size.height)!, width: view.frame.width, height: 45)
        
//        pinnedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        pinnedView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
//        pinnedView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let scrollToTopRecognizaer = UITapGestureRecognizer(target: self, action: #selector(scrollToTopOfView))
        contentView.pinnedView.addGestureRecognizer(scrollToTopRecognizaer)
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            print("YOU ARE IN!")
        }
        
//        navigationItem.largeTitleDisplayMode = .never

        

    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        flag = 1
        navigationItem.largeTitleDisplayMode = .never
//        navigationController?.navigationBar.prefersLargeTitles = false
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
    
//    func addSubViews(){
//        [tableViewMain,pinnedView].forEach{self.view.addSubview($0)}
//        myFooterView.addSubview(footerTextLabel)
//        myFooterView.addSubview(footerNumberOfViewLabel)
//
//        myViewHeader.addSubview(headerTextLabel)
//        myViewHeader.addSubview(headerTheme)
//        myViewHeader.addSubview(headerCaller)
//        myViewHeader.addSubview(headerCallee)
//
//        pinnedView.addSubview(lineView)
//        pinnedView.addSubview(pinnedStartLabel)
//        pinnedView.addSubview(pinnedTitleLabel)
//    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Дебаты"
//        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Подписаться", style: .plain, target: self, action: #selector(nothingHere))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)

    }
    
    @objc
    func nothingHere(){
        
    }
    
//    func setPinnedViewConstrains(){
//
//        pinnedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        pinnedView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
//        pinnedView.heightAnchor.constraint(equalToConstant: 45).isActive = true
//
//
//        lineView.topAnchor.constraint(equalTo: pinnedView.topAnchor, constant: 8).isActive = true
//        lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
//        lineView.bottomAnchor.constraint(equalTo: pinnedView.bottomAnchor, constant: -7).isActive = true
//        lineView.leftAnchor.constraint(equalTo: pinnedView.leftAnchor, constant: 15).isActive = true
//
//        pinnedStartLabel.topAnchor.constraint(equalTo: pinnedView.topAnchor, constant: 8).isActive = true
//        pinnedStartLabel.leftAnchor.constraint(equalTo: lineView.rightAnchor, constant: 5).isActive = true
//
//        pinnedTitleLabel.topAnchor.constraint(equalTo: pinnedStartLabel.bottomAnchor, constant: 4).isActive = true
//        pinnedTitleLabel.leftAnchor.constraint(equalTo: lineView.rightAnchor, constant: 4.5).isActive = true
//        pinnedTitleLabel.rightAnchor.constraint(equalTo: pinnedView.rightAnchor, constant: -25).isActive = true
//    }
    
//    func setConstrains(){
//        tableViewMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        tableViewMain.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        tableViewMain.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//
//        footerTextLabel.topAnchor.constraint(equalTo: myFooterView.topAnchor, constant: 12).isActive = true
//        footerTextLabel.centerXAnchor.constraint(equalTo: myFooterView.centerXAnchor, constant: 0).isActive = true
//
//        footerNumberOfViewLabel.topAnchor.constraint(equalTo: footerTextLabel.bottomAnchor, constant: 5).isActive = true
//        footerNumberOfViewLabel.centerXAnchor.constraint(equalTo: myFooterView.centerXAnchor, constant: 0).isActive = true
//
//        headerTextLabel.topAnchor.constraint(equalTo: myViewHeader.topAnchor, constant: 40).isActive = true
//        headerTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//        headerTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
//
//        headerTheme.topAnchor.constraint(equalTo: headerTextLabel.bottomAnchor, constant: 20).isActive = true
//        headerTheme.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor, constant: 0).isActive = true
//
//        headerCaller.topAnchor.constraint(equalTo: headerTheme.bottomAnchor, constant: 5).isActive = true
//        headerCaller.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor, constant: 0).isActive = true
//
//        headerCallee.topAnchor.constraint(equalTo: headerCaller.bottomAnchor, constant: 5).isActive = true
//        headerCallee.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor, constant: 0).isActive = true
//    }
    
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
//        tableViewMain.tableFooterView = myFooterView
        
        
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

//            return view
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            return view
//            print("YOU ARE IN!")
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
        
//        if indexPath.row % 2 == 0{
////            cell.photoImageView.image = answersArray[indexPath.row].photo
//            cell.photoImageView.setImage(answersArray[indexPath.row].photo, for: .normal)
//            cell.nameLabel.text = answersArray[indexPath.row].namesurname
//            cell.adressLabel.text = answersArray[indexPath.row].maintext
//        } else {
////            cell.photoImageView.image = secondAnswersArray[indexPath.row].photo
//            cell.photoImageView.setImage(secondAnswersArray[indexPath.row].photo, for: .normal)
//            cell.nameLabel.text = secondAnswersArray[indexPath.row].namesurname
//            cell.adressLabel.text = secondAnswersArray[indexPath.row].maintext
//        }
        
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
//            navigationController?.navigationBar.backgroundColor = .red
            contentView.pinnedView.isHidden = false
            
        } else if self.lastContentOffset + 265 > scrollView.contentOffset.y {
            // did move down
            print("\nMOVE UP")
//            navigationController?.navigationBar.backgroundColor = .green
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
