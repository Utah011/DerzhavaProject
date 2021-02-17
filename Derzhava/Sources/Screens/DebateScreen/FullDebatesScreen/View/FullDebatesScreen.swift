//
//  FullDebatesScreen.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 15.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class FullDebateScreenView: UIView {
    
    let tableViewMain = UITableView()
    let pinnedView = UIView()
    let lineView = UIView()
    let pinnedStartLabel = UILabel()
    let pinnedTitleLabel = UILabel()
    let myFooterView = UIView()
    let footerTextLabel = UILabel()
    let footerNumberOfViewLabel = UILabel()
    let myViewHeader = UIView()
    let headerTextLabel = UILabel()
    let headerTheme = UILabel()
    let headerCaller = UILabel()
    let headerCallee = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        

        tableViewMain.translatesAutoresizingMaskIntoConstraints = false
        tableViewMain.separatorStyle = .singleLine
        tableViewMain.isScrollEnabled = true
        tableViewMain.allowsSelection = false
        addSubview(tableViewMain)

        pinnedView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 0.94)
        pinnedView.translatesAutoresizingMaskIntoConstraints = false
        pinnedView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        pinnedView.layer.borderWidth = 1
        addSubview(pinnedView)

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        pinnedView.addSubview(lineView)

        pinnedStartLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedStartLabel.numberOfLines = 1
        pinnedStartLabel.text = "Начало дебатов"
        pinnedStartLabel.font = UIFont(name: "SFProDisplay-SemiBold", size: 11)
        pinnedStartLabel.textAlignment = .left
        pinnedStartLabel.textColor = .black
        pinnedView.addSubview(pinnedStartLabel)
    
        pinnedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedTitleLabel.numberOfLines = 1
        pinnedTitleLabel.font = UIFont(name: "SFProText-Regular", size: 11)
        pinnedTitleLabel.textAlignment = .left
        pinnedTitleLabel.textColor = .black
        pinnedTitleLabel.lineBreakMode = .byTruncatingTail
        pinnedView.addSubview(pinnedTitleLabel)

        myFooterView.backgroundColor = .clear
        myFooterView.frame = CGRect(x: 0, y: 0, width: 100, height: 103)
        myFooterView.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        myFooterView.layer.borderWidth = 0.5

        footerTextLabel.translatesAutoresizingMaskIntoConstraints = false
        footerTextLabel.text = "Выборы"
        footerTextLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        footerTextLabel.textAlignment = .center
        footerTextLabel.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        myFooterView.addSubview(footerTextLabel)

        footerNumberOfViewLabel.translatesAutoresizingMaskIntoConstraints = false
        footerNumberOfViewLabel.text = "547 тысяч просмотров"
        footerNumberOfViewLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        footerNumberOfViewLabel.textAlignment = .center
        footerNumberOfViewLabel.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        myFooterView.addSubview(footerNumberOfViewLabel)

        myViewHeader.backgroundColor = .clear
        myViewHeader.frame = CGRect(x: 0, y: 0, width: 100, height: 220)

        headerTextLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTextLabel.numberOfLines = 2
        headerTextLabel.text = "Выборы в Московскую государственную думу"
        headerTextLabel.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        headerTextLabel.textAlignment = .center
        headerTextLabel.textColor = .black
        myViewHeader.addSubview(headerTextLabel)

        headerTheme.translatesAutoresizingMaskIntoConstraints = false
        headerTheme.text = "Тема: Выборы"
        headerTheme.font = UIFont(name: "SFProText-Regular", size: 15)
        headerTheme.textAlignment = .center
        headerTheme.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        myViewHeader.addSubview(headerTheme)
        
        headerCaller.translatesAutoresizingMaskIntoConstraints = false
        headerCaller.text = "Вызвал: Денис Мантуров"
        headerCaller.font = UIFont(name: "SFProText-Regular", size: 15)
        headerCaller.textAlignment = .center
        headerCaller.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        myViewHeader.addSubview(headerCaller)

        headerCallee.translatesAutoresizingMaskIntoConstraints = false
        headerCallee.text = "Вызываемый: Владимир Жириновский"
        headerCallee.font = UIFont(name: "SFProText-Regular", size: 15)
        headerCallee.textAlignment = .center
        headerCallee.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        myViewHeader.addSubview(headerCallee)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableViewMain.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableViewMain.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tableViewMain.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        footerTextLabel.topAnchor.constraint(equalTo: myFooterView.topAnchor, constant: 12).isActive = true
        footerTextLabel.centerXAnchor.constraint(equalTo: myFooterView.centerXAnchor, constant: 0).isActive = true
        
        footerNumberOfViewLabel.topAnchor.constraint(equalTo: footerTextLabel.bottomAnchor, constant: 5).isActive = true
        footerNumberOfViewLabel.centerXAnchor.constraint(equalTo: myFooterView.centerXAnchor, constant: 0).isActive = true
        
        headerTextLabel.topAnchor.constraint(equalTo: myViewHeader.topAnchor, constant: 40).isActive = true
        headerTextLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        headerTextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        
        headerTheme.topAnchor.constraint(equalTo: headerTextLabel.bottomAnchor, constant: 20).isActive = true
        headerTheme.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor, constant: 0).isActive = true
        
        headerCaller.topAnchor.constraint(equalTo: headerTheme.bottomAnchor, constant: 5).isActive = true
        headerCaller.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor, constant: 0).isActive = true
        
        headerCallee.topAnchor.constraint(equalTo: headerCaller.bottomAnchor, constant: 5).isActive = true
        headerCallee.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor, constant: 0).isActive = true
        
        //
        pinnedView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        pinnedView.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true
        pinnedView.heightAnchor.constraint(equalToConstant: 45).isActive = true

        lineView.topAnchor.constraint(equalTo: pinnedView.topAnchor, constant: 8).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.bottomAnchor.constraint(equalTo: pinnedView.bottomAnchor, constant: -7).isActive = true
        lineView.leftAnchor.constraint(equalTo: pinnedView.leftAnchor, constant: 15).isActive = true
        
        pinnedStartLabel.topAnchor.constraint(equalTo: pinnedView.topAnchor, constant: 8).isActive = true
        pinnedStartLabel.leftAnchor.constraint(equalTo: lineView.rightAnchor, constant: 5).isActive = true
        
        pinnedTitleLabel.topAnchor.constraint(equalTo: pinnedStartLabel.bottomAnchor, constant: 4).isActive = true
        pinnedTitleLabel.leftAnchor.constraint(equalTo: lineView.rightAnchor, constant: 4.5).isActive = true
        pinnedTitleLabel.rightAnchor.constraint(equalTo: pinnedView.rightAnchor, constant: -25).isActive = true
    }

}
