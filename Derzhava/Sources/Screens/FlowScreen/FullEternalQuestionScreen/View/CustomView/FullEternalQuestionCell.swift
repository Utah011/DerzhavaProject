//
//  gfgd.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 17.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation

import UIKit
//тут

class FullEternalQuestionCell: UITableViewCell {
    
    let titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
//        lbl.text = "Почему ВВП не растет с 2008 года?"
        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let mainTextLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
//        lbl.text = "Несмотря на внешнее сходство с кризисами 1998 и 2008 гг., последний спад оказался куда глубже и сложнее. Его можно сравнить лишь трансформационным периодом 1990-х гг."
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        addSubviews()
        setConstrains()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: EternalQuestionsViewModel){
        titleLabel.text = viewModel.title
        mainTextLabel.text = viewModel.mainText
    }
    
    func addSubviews(){
        [titleLabel,mainTextLabel].forEach{self.contentView.addSubview($0)}
    }
    
    func setConstrains(){
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        
        mainTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        mainTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        mainTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
    }
    

}

