//
//  HeadersAndFooters.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 27.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class MyCustomHeaderForFullNews: UITableViewHeaderFooterView {
    let title:UILabel = {
        let tlt = UILabel()
        tlt.translatesAutoresizingMaskIntoConstraints = false
//        tlt.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        return tlt
    }()
    let image = UIImageView()
    
    let buttonImage:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var recognizer = UITapGestureRecognizer()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false

        //contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(buttonImage)
        contentView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)

        // Center the image vertically and place it near the leading
        // edge of the view. Constrain its width and height to 50 points.
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            //title.widthAnchor.constraint(equalToConstant: 300),
            //title.heightAnchor.constraint(equalToConstant: 60),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30)
        ])
        
        buttonImage.topAnchor.constraint(equalTo: title.topAnchor, constant: 5).isActive = true
        buttonImage.leftAnchor.constraint(equalTo: title.rightAnchor, constant: 10).isActive = true
        buttonImage.widthAnchor.constraint(equalToConstant: 10).isActive = true
        buttonImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        buttonImage.isHidden = true
    }
    

}

class MyCustomSearchFooterForFullNews: UITableViewHeaderFooterView {
    
    let footerForTableView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        return view
    }()
    
    let footerPhotoForTableView:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "polit")
        img.clipsToBounds = true
        img.layer.cornerRadius = 16
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let footerTextFieldForTableView:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Напишите ответ"
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.layer.borderWidth = 1
        txt.layer.borderColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.8666666667, alpha: 1)
        return txt
    }()
    
    let footerButtonForTableView:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrowforopinion"), for: .normal)
        return btn
    }()
    
    var recognizer = UITapGestureRecognizer()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1)
        
        addsubviews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addsubviews(){
        contentView.addSubview(footerForTableView)
        [footerPhotoForTableView,footerTextFieldForTableView,footerButtonForTableView].forEach{self.footerForTableView.addSubview($0)}
    }
    
    func setConstrains(){
        footerForTableView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 65)
        footerPhotoForTableView.frame = CGRect(x: 15, y: 16, width: 32, height: 32)
        footerTextFieldForTableView.frame = CGRect(x: 57, y: 14, width: 267, height: 36)
        footerButtonForTableView.frame = CGRect(x: 336, y: 23, width: 20, height: 18)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.footerTextFieldForTableView.frame.height))
        footerTextFieldForTableView.leftView = paddingView
        footerTextFieldForTableView.leftViewMode = UITextField.ViewMode.always
    }

    

}
