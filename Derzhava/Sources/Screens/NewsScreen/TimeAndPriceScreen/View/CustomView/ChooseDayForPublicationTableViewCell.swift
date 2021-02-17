//
//  awfaf.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 10.01.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation

import UIKit

protocol ChooseDayTableViewCellDelegate: AnyObject {
    func didTapDay(index: Int)
}

class ChooseDayForPublicationTableViewCell: UITableViewCell {
    
    weak var delegate: ChooseDayTableViewCellDelegate?
    var index: IndexPath?
    
    let todayButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Сегодня", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 15
        btn.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        btn.addTarget(self, action: #selector(todayButtonActions), for: .touchUpInside)
        return btn
    }()
    
    let tomorrowButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Завтра", for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 15
        btn.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        
        addSubviews()
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        [todayButton,tomorrowButton].forEach{self.contentView.addSubview($0)}
    }
    
    func setConstraints(){
        todayButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 48).isActive = true
        todayButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        todayButton.widthAnchor.constraint(equalToConstant: 94).isActive = true
        todayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        tomorrowButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -48).isActive = true
        tomorrowButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        tomorrowButton.widthAnchor.constraint(equalToConstant: 94).isActive = true
        tomorrowButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc
    func todayButtonActions(){
//        todayButton.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//        todayButton.setTitleColor(.white, for: .normal)
        delegate?.didTapDay(index: index?.row ?? 0)
        print("hey man wassap")
    }
    
    


    

}

