//
//  FullEternalQuestionViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 17.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class FullEternalQuestionViewController: UIViewController {
    
    let contentView = FullEternalQuestionScreenView()
    var selectedIndex = IndexPath()
    
//    let tableview:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .singleLine
//        table.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
//        return table
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setNavigationController()
        setTableView()
//        addSubviews()
//        setConstrains()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Вечный вопрос"
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        navigationItem.largeTitleDisplayMode = .never
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
        contentView.tableview.register(FullEternalQuestionCell.self, forCellReuseIdentifier: "FullEternalQuestionCell")
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

extension FullEternalQuestionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomSearchFooterForFullNews") as! MyCustomSearchFooterForFullNews
        switch section {
        case 0:
            return UIView()
        case 1:
            return UIView()
        default:
            if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
                return view
//                print("YOU ARE IN!")
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeaderForFullNews") as! MyCustomHeaderForFullNews
        
        switch section {
        case 0:
            return UIView()
        case 1:
            view.title.text = "Новые мнения"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            return view
        default:
            view.title.text = "Прочитанные мнения"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            return view
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            let fontForTitleLabel = UIFont(name: "SFProDisplay-Bold", size: 22) ?? UIFont()
            let fontForMainTextLabel = UIFont(name: "SFProText-Regular", size: 17) ?? UIFont()
                
            let heightForTitle = heightForView(text: eternalQuestionsArray[indexPath.row].title, font: fontForTitleLabel)
            let heightForMainText = heightForView(text: eternalQuestionsArray[indexPath.row].maintext, font: fontForMainTextLabel)
                
            print("THIS IS HEIGHT FOR TITLE - \(heightForTitle)")
            print("THIS IS HEIGHT FOR MAIN TEXT - \(heightForMainText)")
                
            return 45 + heightForTitle + heightForMainText
            
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let eternalQuestionModel = eternalQuestionsArray[indexPath.row]
        let newOpinions = answersArray[indexPath.row]
        let readOpinions = secondAnswersArray[indexPath.row]
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FullEternalQuestionCell") as? FullEternalQuestionCell else {
                assertionFailure("FullEternalQuestionCell is not available")
                return UITableViewCell()
            }
//            cell.titleLabel.text = eternalQuestionsArray[indexPath.row].title
//            cell.mainTextLabel.text = eternalQuestionsArray[indexPath.row].maintext
            cell.configure(with: EternalQuestionsViewModel(with: eternalQuestionModel))
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThisIsIt", for: indexPath) as? ThisIsIt else {
                assertionFailure("ThisIsIt is not available")
                return UITableViewCell()
            }

//            cell.photoImageView.image = answersArray[indexPath.row].photo
//            cell.nameLabel.text = answersArray[indexPath.row].namesurname
//            cell.adressLabel.text = answersArray[indexPath.row].maintext
//            cell.positionLabel.text = answersArray[indexPath.row].position
//            cell.timeLabel.text = answersArray[indexPath.row].time
            cell.configure(with: AnswersViewModel(with: newOpinions))
            
            if selectedIndex == indexPath {
                cell.readView.isHidden = true
            } else {
                cell.readView.isHidden = false
            }
                        
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThisIsIt", for: indexPath) as? ThisIsIt else {
                assertionFailure("ThisIsIt is not available")
                return UITableViewCell()
            }

//                cell.photoImageView.image = secondAnswersArray[indexPath.row].photo
//                cell.nameLabel.text = secondAnswersArray[indexPath.row].namesurname
//                cell.adressLabel.text = secondAnswersArray[indexPath.row].maintext
//                cell.positionLabel.text = secondAnswersArray[indexPath.row].position
//                cell.timeLabel.text = secondAnswersArray[indexPath.row].time
            cell.configure(with: AnswersViewModel(with: readOpinions))
            
            if selectedIndex == indexPath {
                cell.readView.isHidden = true
            } else {
                cell.readView.isHidden = false
            }
            
            return cell
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
