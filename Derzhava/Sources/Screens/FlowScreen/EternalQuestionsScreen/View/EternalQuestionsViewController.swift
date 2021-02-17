//
//  EternalQuestionsViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 17.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class EternalQuestionsViewController: UIViewController {
        
    let contentView = EternalQuestionsScreenView()
//    let collectionViewEternalQuestions:UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 15
//        layout.scrollDirection = .vertical
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
//        cv.showsHorizontalScrollIndicator = false
//        return cv
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setNavigationController()
//        addSubViews()
        setCollectionView()
//        setConstrains()
        
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Вечные вопрос"
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        navigationItem.largeTitleDisplayMode = .never
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
    }
    
//    func addSubViews(){
//        [collectionViewEternalQuestions].forEach{self.view.addSubview($0)}
//    }
//
//    func setConstrains(){
//        collectionViewEternalQuestions.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        collectionViewEternalQuestions.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
//        collectionViewEternalQuestions.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }
    
    func setCollectionView(){
        contentView.collectionViewEternalQuestions.delegate = self
        contentView.collectionViewEternalQuestions.dataSource = self
        contentView.collectionViewEternalQuestions.register(FlowCollectionViewCell.self, forCellWithReuseIdentifier: "FlowCollectionViewCell")
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

}

extension EternalQuestionsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset.top = 15
        
        let fontForTitleLabel = UIFont(name: "SFProDisplay-Semibold", size: 15) ?? UIFont()
        let fontForMainTextLabel = UIFont(name: "SFProText-Regular", size: 13) ?? UIFont()
        
        let heightForTitle = heightForView(text: eternalQuestionsArray[indexPath.row].title, font: fontForTitleLabel)
        let heghtForMainText = heightForView(text: eternalQuestionsArray[indexPath.row].maintext, font: fontForMainTextLabel)
        
        print("THIS IS HEIGHT FOR TITLE - \(heightForTitle)")
        print("THIS IS HEIGHT FOR MAIN TEXT - \(heghtForMainText)")

        return CGSize(width: view.frame.width, height: 174 + heightForTitle + heghtForMainText)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eternalQuestionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let eternalQuestionsModel = eternalQuestionsArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlowCollectionViewCell", for: indexPath) as! FlowCollectionViewCell
//        cell.titleLabel.text = eternalQuestionsArray[indexPath.row].title
//        cell.mainTextLabel.text = eternalQuestionsArray[indexPath.row].maintext
        cell.configure(with: EternalQuestionsViewModel(with: eternalQuestionsModel))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let defaulVC = FullEternalQuestionViewController()
        self.navigationController?.pushViewController(defaulVC, animated: true)
    }
    
    
}
