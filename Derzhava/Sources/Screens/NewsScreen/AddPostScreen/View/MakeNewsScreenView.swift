//
//  MakeNewsScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 13.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class MakeNewsScreenView: UIView {
    
    var heightConstraintForTitle = NSLayoutConstraint()
    let loadImageButton = UIButton()
    let imageForLoadButton = UIImageView()
    let labelForLoadButton = UILabel()
    var newsImageView = UIImageView()
    let deleteImageButton = UIButton()
    let titleTextView = UITextView()
    let mainTextTextView = UITextView()
    let scrollview = UIScrollView()
    let addPoliticianButton = UIButton()
    let labelForAddPoliticianButton = UILabel()
    let chooseDataAndTimeButton = UIButton()
    let labelForChooseDataAndTimeButton = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollview)

        loadImageButton.translatesAutoresizingMaskIntoConstraints = false
        loadImageButton.clipsToBounds = true
        loadImageButton.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        loadImageButton.layer.borderColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        loadImageButton.layer.borderWidth = 1
        loadImageButton.layer.cornerRadius = 8
//        loadImageButton.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
        scrollview.addSubview(loadImageButton)
        
        imageForLoadButton.translatesAutoresizingMaskIntoConstraints = false
        imageForLoadButton.image = UIImage(named: "loadimagearrow")
        loadImageButton.addSubview(imageForLoadButton)
        
        labelForLoadButton.translatesAutoresizingMaskIntoConstraints = false
        labelForLoadButton.text = "Загрузить изображение"
        labelForLoadButton.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        labelForLoadButton.textColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        loadImageButton.addSubview(labelForLoadButton)
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.layer.cornerRadius = 10
        newsImageView.clipsToBounds = true
        newsImageView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.isHidden = true
        scrollview.addSubview(newsImageView)
        
        deleteImageButton.translatesAutoresizingMaskIntoConstraints = false
        deleteImageButton.setImage(UIImage(named: "deleteimageicon"), for: .normal)
        deleteImageButton.isHidden = true
//        deleteImageButton.addTarget(self, action: #selector(deleteImageAction), for: .touchUpInside)
        scrollview.addSubview(deleteImageButton)
        
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        titleTextView.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        titleTextView.backgroundColor = .none
        titleTextView.text = "Напишите"
        titleTextView.textColor = UIColor.lightGray
        scrollview.addSubview(titleTextView)

        mainTextTextView.translatesAutoresizingMaskIntoConstraints = false
        mainTextTextView.font = UIFont(name: "SFProText-Regular", size: 17)
        mainTextTextView.backgroundColor = .none
        mainTextTextView.text = "Вставьте текст статьи"
        mainTextTextView.textColor = UIColor.lightGray
        scrollview.addSubview(mainTextTextView)
                
        addPoliticianButton.translatesAutoresizingMaskIntoConstraints = false
        addPoliticianButton.backgroundColor = .white
        addPoliticianButton.layer.borderWidth = 0.5
        addPoliticianButton.layer.borderColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        addPoliticianButton.addTarget(self, action: #selector(goToAddPoloticiansScreen), for: .touchUpInside)
        addSubview(addPoliticianButton)
        
        labelForAddPoliticianButton.translatesAutoresizingMaskIntoConstraints = false
        labelForAddPoliticianButton.text = "Добавить политиков (макс. 5)"
        labelForAddPoliticianButton.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        labelForAddPoliticianButton.textColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        addPoliticianButton.addSubview(labelForAddPoliticianButton)
        
        chooseDataAndTimeButton.translatesAutoresizingMaskIntoConstraints = false
        chooseDataAndTimeButton.backgroundColor = .white
        chooseDataAndTimeButton.layer.borderWidth = 0.5
        chooseDataAndTimeButton.layer.borderColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        chooseDataAndTimeButton.addTarget(self, action: #selector(goToChooseTimeAndPriceScreen), for: .touchUpInside)
        addSubview(chooseDataAndTimeButton)
        
        labelForChooseDataAndTimeButton.translatesAutoresizingMaskIntoConstraints = false
        labelForChooseDataAndTimeButton.text = "Выбрать дату и время публикации"
        labelForChooseDataAndTimeButton.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        labelForChooseDataAndTimeButton.textColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        chooseDataAndTimeButton.addSubview(labelForChooseDataAndTimeButton)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        scrollview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollview.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: addPoliticianButton.topAnchor, constant: 0).isActive = true
        
        loadImageButton.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 20).isActive = true
        loadImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        loadImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        loadImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageForLoadButton.topAnchor.constraint(equalTo: loadImageButton.topAnchor, constant: 15).isActive  = true
        imageForLoadButton.leftAnchor.constraint(equalTo: loadImageButton.leftAnchor, constant: 60).isActive = true
        imageForLoadButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageForLoadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        labelForLoadButton.centerYAnchor.constraint(equalTo: loadImageButton.centerYAnchor, constant: 0).isActive = true
        labelForLoadButton.leftAnchor.constraint(equalTo: imageForLoadButton.rightAnchor, constant: 11).isActive = true
        
        deleteImageButton.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 30).isActive = true
        deleteImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        deleteImageButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        deleteImageButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        newsImageView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 18).isActive = true
        newsImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        newsImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
                
        titleTextView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 20).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        titleTextView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        mainTextTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 10).isActive = true
        mainTextTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        mainTextTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        mainTextTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addPoliticianButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -84).isActive = true
        addPoliticianButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        addPoliticianButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelForAddPoliticianButton.centerYAnchor.constraint(equalTo: addPoliticianButton.centerYAnchor, constant: 0).isActive = true
        labelForAddPoliticianButton.leftAnchor.constraint(equalTo: addPoliticianButton.leftAnchor, constant: 15).isActive = true
        
        chooseDataAndTimeButton.topAnchor.constraint(equalTo: addPoliticianButton.bottomAnchor, constant: 0).isActive = true
        chooseDataAndTimeButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        chooseDataAndTimeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelForChooseDataAndTimeButton.centerYAnchor.constraint(equalTo: chooseDataAndTimeButton.centerYAnchor, constant: 0).isActive = true
        labelForChooseDataAndTimeButton.leftAnchor.constraint(equalTo: chooseDataAndTimeButton.leftAnchor, constant: 15).isActive = true
    }

}
