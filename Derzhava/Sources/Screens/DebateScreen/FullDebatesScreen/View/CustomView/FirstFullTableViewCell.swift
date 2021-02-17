//
//  FirstFullTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 30.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

//import ExpandableLabel

protocol FullDebateTableViewProtocol: AnyObject {
    func goToUser(index: Int)
}

class FirstFullTableViewCell: UITableViewCell {
    
    weak var delegate:FullDebateTableViewProtocol?
    var index: IndexPath?
    
//    let photoImageView:UIImageView = {
//        let img = UIImageView()
//        img.clipsToBounds = true
//        //img.image = UIImage(named: "polit")
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.layer.cornerRadius = 25
//        img.contentMode = .scaleAspectFill
//        return img
//    }()
    
    let photoImageView:UIButton = {
        let img = UIButton()
        img.clipsToBounds = true
        //img.image = UIImage(named: "polit")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 25
        img.imageView?.contentMode = .scaleAspectFill
//        img.addTarget(self, action: #selector(clickMe(sender:)), for: .touchUpInside)
        return img
    }()
    
    
    let bottomView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.layer.cornerRadius = 16
        //view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()

    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        //lbl.font = lbl.font.withSize(20)
        lbl.textColor = .black
        lbl.lineBreakMode = .byTruncatingTail
        //lbl.text = "Иван Волкодавский"
        return lbl
    }()
    
    let adressLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 17)
        lbl.textColor = .black
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    let myButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitleColor(UIColor(red: 0.176, green: 0.322, blue: 0.486, alpha: 1), for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)

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
        //lbl.frame = CGRect(x:0,y:0,width:lbl.intrinsicContentSize.width,height:lbl.intrinsicContentSize.height)
        //lbl.text = "Председатель правления Приморского края"
        lbl.text = "Сегодня в 14:20"
        lbl.lineBreakMode = .byWordWrapping
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    
    let mainView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainView)
        [photoImageView,nameLabel,positionLabel,adressLabel].forEach{self.mainView.addSubview($0)}

        
        setConstraints()
        
                let heightOfCellText = adressLabel.systemLayoutSizeFitting(CGSize(width: contentView.frame.width, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        print("height of the cell \(heightOfCellText)")
        
        photoImageView.addTarget(self, action: #selector(clickMe(sender:)), for: .touchUpInside)

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func clickMe(sender: Any){
        delegate?.goToUser(index: index?.row ?? 00)
    }

    func setConstraints(){
        
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mainView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
//        mainView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true

        photoImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 15).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        nameLabel.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
        
        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 0).isActive = true
        positionLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10).isActive = true
        positionLabel.widthAnchor.constraint(equalToConstant: 146).isActive = true
        
        adressLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor,constant: 18).isActive = true
        adressLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 75).isActive = true
        adressLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -8).isActive = true
        //adressLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
    }

}
