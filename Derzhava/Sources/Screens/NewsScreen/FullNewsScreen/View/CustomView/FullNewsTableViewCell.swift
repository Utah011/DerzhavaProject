//
//  FullNewsTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 11.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class FullNewsTableViewCell: UITableViewCell {
    
    let container:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.background
        return view
    }()
    
    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let headlineLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.contentMode = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        return lbl
    }()
    
    let mainTextLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        return lbl
    }()
    
    let asktoAnswerLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
        lbl.text = "Просим ответить"
        return lbl
    }()
    
    let collectionViewtoAnswer:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(FullNewsCollectionViewCell.self, forCellWithReuseIdentifier: "FullNewsCollectionViewCell")
        cv.backgroundColor = Colors.background
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Colors.background
        setCollectionView()
        addAllSubviews()
        setConstrains()
    }
    
    func configure(with viewModel: NewsViewModel){
        photoImageView.image = viewModel.photo
        headlineLabel.text = viewModel.newstitle
        mainTextLabel.text = viewModel.newstext
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionView(){
        collectionViewtoAnswer.delegate = self
        collectionViewtoAnswer.dataSource = self
    }
    
    func addAllSubviews(){
        [container].forEach{self.contentView.addSubview($0)}
        [photoImageView,headlineLabel,mainTextLabel,asktoAnswerLabel,collectionViewtoAnswer].forEach{self.container.addSubview($0)}
    }
    
    func setConstrains(){
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        container.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        container.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 194).isActive = true
        
        headlineLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 30).isActive = true
        headlineLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        headlineLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        
        mainTextLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 15).isActive = true
        mainTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        mainTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        
        asktoAnswerLabel.topAnchor.constraint(equalTo: mainTextLabel.bottomAnchor, constant: 30).isActive = true
        asktoAnswerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        
        collectionViewtoAnswer.topAnchor.constraint(equalTo: asktoAnswerLabel.bottomAnchor, constant: 10).isActive = true
        collectionViewtoAnswer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        collectionViewtoAnswer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        collectionViewtoAnswer.heightAnchor.constraint(equalToConstant: 108).isActive = true
    }
    
}

extension FullNewsTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset.left = 20
        collectionView.contentInset.top = -30
        collectionView.contentInset.right = 20
        
        return CGSize(width: 65, height: 65)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celll = collectionView.dequeueReusableCell(withReuseIdentifier: "FullNewsCollectionViewCell", for: indexPath) as! FullNewsCollectionViewCell
        celll.bg.image = data[indexPath.row].backgroundImage
        celll.nameSurnameLabel.text = data[indexPath.row].title
        return celll
    }
    
    
}
