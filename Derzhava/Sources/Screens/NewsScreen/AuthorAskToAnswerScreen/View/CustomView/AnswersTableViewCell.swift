//
//  AnswersTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 11.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class ThisIsIt: UITableViewCell {
    
    let photoImageView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 25
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let bottomView:UIView = {
        let view = UIView()
        view.backgroundColor = Colors.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        lbl.textColor = Colors.black
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    let adressLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        lbl.textColor = Colors.black
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    let myButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitleColor(UIColor(red: 0.176, green: 0.322, blue: 0.486, alpha: 1), for: .normal)
        btn.setTitleColor(Colors.white, for: .normal)

        btn.setTitle("Далее", for: .normal)
        btn.titleLabel?.font = UIFont(name: "OpenSans-SemiBold", size: 20)
        btn.layer.cornerRadius = 16
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let positionLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    let timeLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 12)
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    let container: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = Colors.background
        view.layer.cornerRadius = 0
        return view
    }()
    
    let lineView: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = .systemTeal
        v.layer.cornerRadius = 8
        return v
    }()
    
    let readView: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = Colors.background
        lbl.text = "Читать далее..."
        lbl.textColor = Colors.darkBlue
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Colors.background

        contentView.addSubview(container)
        container.addSubview(nameLabel)
        container.addSubview(photoImageView)
        container.addSubview(adressLabel)
        container.addSubview(positionLabel)
        container.addSubview(timeLabel)
        
        contentView.addSubview(readView)
        setConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: AnswersViewModel){
        photoImageView.image = viewModel.photo
        nameLabel.text = viewModel.namesurname
        adressLabel.text = viewModel.maintext
        positionLabel.text = viewModel.position
        timeLabel.text = viewModel.time
    }
    
    func animate() {
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.contentView.layoutIfNeeded()
        })
    }

    func setConstraints(){
        
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        container.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22).isActive = true

        photoImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: container.leftAnchor,constant: 15).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: 15).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -15).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 0).isActive = true
        positionLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        positionLabel.widthAnchor.constraint(equalToConstant: 276).isActive = true
        
        adressLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor,constant: 11).isActive = true
        adressLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 75).isActive = true
        adressLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -8).isActive = true
        
        readView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        readView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 75).isActive = true
        readView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        readView.heightAnchor.constraint(equalToConstant: 19.5).isActive = true
    }

}
