//
//  FullNewsViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 11.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class FullNewsViewController: UIViewController {
    
    let contentView = FullNewsScreenView()
    var lastContentOffset: CGFloat = 0
    var selectedIndex = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
                
        exampleFilling()
        exampleAnswers()
        setNavigationController()
        settingTableView()
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        flag = 0
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "РИА"
        
        let rightView = UIButton()
        rightView.setImage(UIImage(named: "riasmalllogo"), for: .normal)
        rightView.addTarget(self, action: #selector(goToUser), for: .touchUpInside)
        
        let fas = UIBarButtonItem(customView: rightView)
        navigationItem.rightBarButtonItem = fas
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = Colors.darkBlue
    }
    
    @objc
    func goToUser(){
        let vc = FullInformationAboutUserViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func settingTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(FullNewsTableViewCell.self, forCellReuseIdentifier: "FullNewsTableViewCell")
        contentView.tableview.register(ThisIsIt.self, forCellReuseIdentifier: "ThisIsIt")
        contentView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
        contentView.tableview.register(MyCustomSearchFooterForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomSearchFooterForFullNews")
    }
    
    func heightForView(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 30, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    func secondHeightForView(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 83, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = text
        label.font = font
        label.sizeToFit()
        return label.frame.height
    }

}

extension FullNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 4
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeaderForFullNews") as! MyCustomHeaderForFullNews
        
        switch section {
        case 0:
            return UIView()
        case 1:
            view.title.text = "Ответы"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            return view
        default:
            view.title.text = "Мнения"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomSearchFooterForFullNews") as! MyCustomSearchFooterForFullNews
        switch section {
        case 0:
            return UIView()
        case 1:
            return UIView()
        default:
            if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
                print("YOU ARE IN!")
                return view
            } else {
                return UIView()
            }
            
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        switch section {
        case 0:
            return 0
        case 1:
            return 0
        default:
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 0
        case 1:
            return 60
        default:
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsModel = newsArray[indexPath.row]
        let answerModel = answersArray[indexPath.row]
        let secondAnswerModel = secondAnswersArray[indexPath.row]
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FullNewsTableViewCell") as! FullNewsTableViewCell
            cell.configure(with: NewsViewModel(with: newsModel))
            return cell
        case 1:
            let cellAnswers = tableView.dequeueReusableCell(withIdentifier: "ThisIsIt", for: indexPath) as! ThisIsIt
            cellAnswers.configure(with: AnswersViewModel(with: answerModel))
            
            if selectedIndex == indexPath {
                cellAnswers.readView.isHidden = true
            } else {
                cellAnswers.readView.isHidden = false
            }
                        
            return cellAnswers
        default:
            let cellOpinions = tableView.dequeueReusableCell(withIdentifier: "ThisIsIt", for: indexPath) as! ThisIsIt
            cellOpinions.configure(with: AnswersViewModel(with: secondAnswerModel))
            
            if selectedIndex == indexPath {
                cellOpinions.readView.isHidden = true
            } else {
                cellOpinions.readView.isHidden = false
            }
            
            return cellOpinions
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
                guard let fontForHeadlineText = UIFont(name: "SFProDisplay-Bold", size: 22) else {
                assertionFailure("\nfontForHeadlineText is not available")
                return 0
            }
            
            guard let fontForMainText = UIFont(name: "SFProText-Regular", size: 17) else {
                assertionFailure("\nfontForMainText is not available")
                return 0
            }
            
            guard let fontForAskToAsnwerLabel = UIFont(name: "SFProDisplay-Semibold", size: 17) else {
                assertionFailure("\nfontForMainText is not available")
                return 0
            }
            
            let heightOfHeadlineText = heightForView(text: newsArray[indexPath.row].newstitle, font: fontForHeadlineText)
            let heightOfTheMainText = heightForView(text: newsArray[indexPath.row].newstext, font: fontForMainText)
            let heightOfAskToAnswerLabel = heightForView(text: "Просим ответить", font: fontForAskToAsnwerLabel)
            
            print("Height of the headline text using function HERE - \(heightOfHeadlineText)")
            print("Height of the main text using function HERE - \(heightOfTheMainText)")
            print("Height of the askToAnswerLabel using function HERE - \(heightOfAskToAnswerLabel)")

            return 279 + heightOfHeadlineText + heightOfTheMainText + heightOfAskToAnswerLabel + 108 + 5
            
        case 1:
            
            guard let fontForNameLabelInAnswerCell = UIFont(name: "SFProDisplay-Semibold", size: 20) else {
                assertionFailure("\nfontForNameLabelInAnswerCell is not available")
                return 0
            }
            
            guard let fontForPositionLabelInAnswerCell = UIFont(name: "SFProText-Regular", size: 11) else {
                assertionFailure("\nfontForPositionLabelInAnswerCell is not available")
                return 0
            }
            
            guard let fontForMainTextLabelInAnswerCell = UIFont(name: "SFProText-Regular", size: 17) else {
                assertionFailure("\nfontForMainTextLabelInAnswerCell is not available")
                return 0
            }
            
            let heightOfNameLabel = heightForView(text: answersArray[indexPath.row].namesurname, font: fontForNameLabelInAnswerCell)
            let heightOfPositionLabel = heightForView(text: answersArray[indexPath.row].position, font: fontForPositionLabelInAnswerCell)
            let heightOfMainTextLabel = secondHeightForView(text: answersArray[indexPath.row].maintext, font: fontForMainTextLabelInAnswerCell)

            print("\nHeight of answer name using function - \(heightOfNameLabel)")
            print("\nHeight of answer position using function - \(heightOfPositionLabel)")
            print("\nHeight of answer main text using function - \(heightOfMainTextLabel)")

            var a:CGFloat = 0
            
            if selectedIndex == indexPath {
                    a = 140 + heightOfMainTextLabel
                    return a
                }
            return 310
        default:
            
            guard let fontForNameLabelInAnswerCell = UIFont(name: "SFProDisplay-Semibold", size: 20) else {
                assertionFailure("\nfontForNameLabelInAnswerCell is not available")
                return 0
            }
            
            guard let fontForPositionLabelInAnswerCell = UIFont(name: "SFProText-Regular", size: 11) else {
                assertionFailure("\nfontForPositionLabelInAnswerCell is not available")
                return 0
            }
            
            guard let fontForMainTextLabelInAnswerCell = UIFont(name: "SFProText-Regular", size: 17) else {
                assertionFailure("\nfontForMainTextLabelInAnswerCell is not available")
                return 0
            }
            
            let heightOfNameLabel = heightForView(text: secondAnswersArray[indexPath.row].namesurname, font: fontForNameLabelInAnswerCell)
            let heightOfPositionLabel = heightForView(text: secondAnswersArray[indexPath.row].position, font: fontForPositionLabelInAnswerCell)
            let heightOfMainTextLabel = secondHeightForView(text: secondAnswersArray[indexPath.row].maintext, font: fontForMainTextLabelInAnswerCell)

            print("\nHeight of answer name using function - \(heightOfNameLabel)")
            print("\nHeight of answer position using function - \(heightOfPositionLabel)")
            print("\nHeight of answer main text using function - \(heightOfMainTextLabel)")

            var a:CGFloat = 0
            
            if selectedIndex == indexPath {
                    a = 140 + heightOfMainTextLabel
                    return a
                }
            return 310
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            print("ola")
        default:
        selectedIndex = indexPath
            
        tableView.beginUpdates()
        tableView.reloadRows(at: [selectedIndex], with: .none)
        tableView.endUpdates()
            
        }
    }
    
}


