//
//  FlowTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 16.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

protocol CellWithCollectionViewDelegate: class {
    func didSelectIndex(_ indexPath: IndexPath)
}

class FlowTableViewCell: UITableViewCell {
    
    weak var delegate: CellWithCollectionViewDelegate?
    
    let collectionViewEternalQuestions:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = Colors.background
        cv.showsHorizontalScrollIndicator = false
        cv.clipsToBounds = true
        cv.layer.cornerRadius = 10
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        exampleAnswers()
        addSubviews()
        setCollectionView()
        setConstrains()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        [collectionViewEternalQuestions].forEach{self.contentView.addSubview($0)}
    }
    
    func setCollectionView(){
        collectionViewEternalQuestions.delegate = self
        collectionViewEternalQuestions.dataSource = self
        collectionViewEternalQuestions.register(FlowCollectionViewCell.self, forCellWithReuseIdentifier: "FlowCollectionViewCell")
    }
    
    func setConstrains(){
        
        collectionViewEternalQuestions.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        collectionViewEternalQuestions.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        collectionViewEternalQuestions.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        collectionViewEternalQuestions.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func heightForView(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.frame.width - 75, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }

}

extension FlowTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        collectionView.contentInset.left = 15
        collectionView.contentInset.right = 15
        
        let fontForTitleLabel = UIFont(name: "SFProDisplay-Semibold", size: 15) ?? UIFont()
        let fontForMainTextLabel = UIFont(name: "SFProText-Regular", size: 13) ?? UIFont()
        
        let heightForTitle = heightForView(text: eternalQuestionsArray[indexPath.row].title, font: fontForTitleLabel)
        let heghtForMainText = heightForView(text: eternalQuestionsArray[indexPath.row].maintext, font: fontForMainTextLabel)
        
        print("THIS IS HEIGHT FOR TITLE - \(heightForTitle)")
        print("THIS IS HEIGHT FOR MAIN TEXT - \(heghtForMainText)")

        return CGSize(width: 325, height: 195 + heightForTitle + heghtForMainText)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let eternalQuestionModel = eternalQuestionsArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlowCollectionViewCell", for: indexPath) as! FlowCollectionViewCell
        cell.configure(with: EternalQuestionsViewModel(with: eternalQuestionModel))
        cell.contentView.clipsToBounds = true
        cell.contentView.layer.cornerRadius = 10
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectIndex(indexPath)
        print("\nNUMBER OF CELL - \(indexPath)")
    }
    
    
}
