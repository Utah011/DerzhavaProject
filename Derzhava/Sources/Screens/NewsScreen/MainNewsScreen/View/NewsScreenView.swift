//
//  NewsScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 13.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class NewsScreenView: UIView {
    
    let tableview = UITableView()
    var nameLabel = UILabel()
    let arrowdown = UIImageView()
    let headerView = UIView()
    let newRequestToReplyImageView = UIImageView()
    let newRequestToReplyNumberLabel = UILabel()
    let newRequestToReplyLabel = UILabel()
    let firstView = UIView()
    var con = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        tableview.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        addSubview(tableview)
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(firstView)
        
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 30)
        nameLabel.textColor = .black
        nameLabel.lineBreakMode = .byClipping
        firstView.addSubview(nameLabel)
        
        arrowdown.translatesAutoresizingMaskIntoConstraints = false
        arrowdown.clipsToBounds = true
        arrowdown.image = UIImage(named: "arrowdown")
        firstView.addSubview(arrowdown)
        
        headerView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        headerView.clipsToBounds = true
        headerView.layer.borderWidth = 0.5
        headerView.layer.borderColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
        
        newRequestToReplyImageView.clipsToBounds = true
        newRequestToReplyImageView.layer.cornerRadius = 12.5
        newRequestToReplyImageView.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        headerView.addSubview(newRequestToReplyImageView)
        
        newRequestToReplyNumberLabel.text = "2"
        newRequestToReplyNumberLabel.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        newRequestToReplyNumberLabel.textColor = .white
        newRequestToReplyNumberLabel.textAlignment = .center
        headerView.addSubview(newRequestToReplyNumberLabel)
        
        newRequestToReplyLabel.text = "Новых просьбы ответить"
        newRequestToReplyLabel.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        newRequestToReplyLabel.textColor = .white
        newRequestToReplyLabel.textAlignment = .center
        newRequestToReplyLabel.textColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        headerView.addSubview(newRequestToReplyLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let con = firstView.topAnchor.constraint(equalTo: topAnchor, constant: 88)
        con.isActive = true
        firstView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 49).isActive = true

        nameLabel.centerYAnchor.constraint(equalTo: firstView.centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: firstView.leftAnchor,constant: 16).isActive = true

        arrowdown.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 23).isActive = true
        arrowdown.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 7).isActive = true
        arrowdown.widthAnchor.constraint(equalToConstant: 18).isActive = true
        arrowdown.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        tableview.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 0).isActive = true
        tableview.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        tableview.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        tableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        setHeader()
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            setHeader()
            tableview.tableHeaderView = headerView
            print("YOU ARE IN!")
        }
        
    }
    
    func setHeader(){
        headerView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 50)
        newRequestToReplyImageView.frame = CGRect(x: 75, y: 13.5, width: 25, height: 25)
        newRequestToReplyNumberLabel.frame = CGRect(x: 77, y: 15, width: 21, height: 21)
        newRequestToReplyLabel.frame = CGRect(x: 101, y: 15, width: 205, height: 22)
    }

}
