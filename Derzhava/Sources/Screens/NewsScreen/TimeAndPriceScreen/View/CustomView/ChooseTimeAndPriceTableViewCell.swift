//
//  ViewControllervevervrv.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 10.01.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//


import UIKit
//import ExpandableLabel

class ChooseTimeAndPriceTableViewCell: UITableViewCell {
    
    let timeLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "19:00"
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
        return lbl
    }()
    
    let checkMark:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "mark")
        img.isHidden = true
        return img
    }()
    
    let notAvailabelLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "2000 Р"
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.white.cgColor
        
        addSubviews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        [timeLabel,checkMark,notAvailabelLabel].forEach{self.contentView.addSubview($0)}
    }
    
    func setConstraints(){
        timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        checkMark.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        checkMark.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        checkMark.widthAnchor.constraint(equalToConstant: 15).isActive = true
        checkMark.heightAnchor.constraint(equalToConstant: 14.6).isActive = true
        
        notAvailabelLabel.rightAnchor.constraint(equalTo: checkMark.leftAnchor, constant: -15.5).isActive = true
        notAvailabelLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            checkMark.isHidden = false
        } else {
            checkMark.isHidden = true
        }
    }
}
