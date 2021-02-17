//
//  FullInfoAboutAuthorViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 27.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class FullInfoAboutAuthorViewController: UIViewController {
    
    let contentView = UserInfoScreenView()
//    let myScrollView:UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.translatesAutoresizingMaskIntoConstraints = false
//        return scroll
//    }()
//
//    let nameLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.numberOfLines = 1
//        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 28)
//
//        if flag == 1 {
//            lbl.text = "Денис Мантуров"
//        } else {
//            lbl.text = "РИА"
//        }
//
////        lbl.text = "Денис Мантуров"
//        return lbl
//    }()
//
//    let aboutAuthorLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.numberOfLines = 1
//        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 17)
//        lbl.text = "Об авторе"
//        return lbl
//    }()
//
//    let aboutAuthorTextLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.textAlignment = .left
//        lbl.lineBreakMode = .byWordWrapping
//        lbl.numberOfLines = 0
//        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
//
//        if flag == 1 {
//            lbl.text = "Российский государственный деятель. Заместитель руководителя Администрации президента Российской Федерации — пресс-секретарь президента Российской Федерации Владимира Путина с 22 мая 2012 года. Действительный государственный советник Российской Федерации 1 класса (2005)."
//        } else {
//            lbl.text = "Российский медиахолдинг, включающий одноимённый телеканал, информационное агентство, газету и журнал. Проводит отраслевые конференции, бизнес-регаты и премии. Является крупнейшим из негосударственных медиахолдингов России. Штаб-квартира находится в Москве"
//        }
//
////        lbl.text = "Российский государственный деятель. Заместитель руководителя Администрации президента Российской Федерации — пресс-секретарь президента Российской Федерации Владимира Путина с 22 мая 2012 года. Действительный государственный советник Российской Федерации 1 класса (2005)."
//        return lbl
//    }()
//
//    let awardsLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.numberOfLines = 1
//        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 17)
//
//        if flag == 1 {
//            lbl.text = "Награды"
//        } else {
//            lbl.text = "Управление"
//        }
//
////        lbl.text = "Награды"
//        return lbl
//    }()
//
//    var awardsTextLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.textAlignment = .left
//        lbl.lineBreakMode = .byWordWrapping
//        lbl.numberOfLines = 0
//        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
//
//
//        if flag == 1 {
//            lbl.text = "• Орден Почёта (6 августа 2007 года) — за активное участие в работе по обеспечению победы заявки города Сочи на право проведения XXII зимних Олимпийских и XI Паралимпийских игр в 2014 году[70]. \n• Орден Дружбы (22 ноября 2003 года) — за активную работу по подготовке и проведению международных встреч по случаю 300-летия Санкт-Петербурга[71]. \n• Орден «Манас» III степени (16 июня 2017 года, Киргизия) — за активное участие в развитии кыргызско-российского социально-экономического сотрудничества и укреплении межгосударственных взаимоотношений[72][73]. \n• Командор ордена «За заслуги перед Итальянской Республикой» (4 октября 2017 года, Италия)[74]. \n• Две благодарности президента РФ (2004, 2007) и благодарность правительства РФ (2009)[5]."
//        } else {
//            lbl.text = "Владелец — Григорий Берёзкин, Генеральный директор — Николай Молибог"
//        }
//
//        return lbl
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        
        settingsNavigationController()
//        settingLayouts()
//        addSubView()
//        setConstrains()

    }
    
    override func loadView() {
        view = contentView
    }
    
    func settingsNavigationController() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Информация"
    }
    
//    func addSubView(){
//        [myScrollView].forEach{self.view.addSubview($0)}
//        [nameLabel, aboutAuthorLabel, aboutAuthorTextLabel, awardsLabel, awardsTextLabel].forEach{self.myScrollView.addSubview($0)}
//    }
//
//    func setConstrains(){
//        myScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
//        myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
//        myScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
//        myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
//
//        nameLabel.topAnchor.constraint(equalTo: myScrollView.topAnchor, constant: 30).isActive = true
//        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//
//        aboutAuthorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
//        aboutAuthorLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//
//        aboutAuthorTextLabel.topAnchor.constraint(equalTo: aboutAuthorLabel.bottomAnchor, constant: 0).isActive = true
//        aboutAuthorTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//        aboutAuthorTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
//
//        awardsLabel.topAnchor.constraint(equalTo: aboutAuthorTextLabel.bottomAnchor, constant: 30).isActive = true
//        awardsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//
//        awardsTextLabel.topAnchor.constraint(equalTo: awardsLabel.bottomAnchor, constant: 0).isActive = true
//        awardsTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
//        awardsTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
//
//    }
    
//    func settingLayouts(){
//        let heightOfAboutAuthorTextLabel = aboutAuthorTextLabel.systemLayoutSizeFitting(CGSize(width: view.frame.width, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
//        print("u got it \(heightOfAboutAuthorTextLabel)")
//        
//        let heightOfAwardsTextLabel = awardsTextLabel.systemLayoutSizeFitting(CGSize(width: view.frame.width, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
//        print("u got it \(heightOfAwardsTextLabel)")
//        
//        myScrollView.contentSize = CGSize(width: view.frame.width, height: 300 + heightOfAboutAuthorTextLabel + heightOfAwardsTextLabel)
//    }


}
