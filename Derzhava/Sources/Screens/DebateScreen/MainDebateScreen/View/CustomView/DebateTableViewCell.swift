//
//  DebateTableViewCell.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 21.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit
//import ExpandableLabel

class DebateTableViewCell: UITableViewCell {
    
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    let betweenCellSpaceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 0.94)
        view.backgroundColor = Colors.background
        return view
    }()
    
    let firstPersonImageView:UIImageView = {
        let img = UIImageView()
//        img.image = UIImage(named: "polit")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 25
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let secondPersonImageView:UIImageView = {
        let img = UIImageView()
//        img.image = UIImage(named: "zhirinovskiy")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 25
        return img
    }()
    
    let firstNameLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
//        lbl.text = "Денис Мантуров"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 17)
        lbl.textColor = Colors.black
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    let secondNameLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
//        lbl.text = "Владимир Жириновский"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 17)
        lbl.textColor = Colors.black
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    let timeLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
//        lbl.text = "14:20"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 12)
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1)
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    
    let themeLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
//        lbl.text = "Выборы • 587к"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1)
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    let mainThemeLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
//        lbl.text = "Выборы в московскую городскую Думу"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 15)
        lbl.textColor = Colors.black
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    let mainTextLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 4
        lbl.textAlignment = .left
        //lbl.text = "Леонид: Кроме того, как утверждают в СК, «ни в одном из предоставленных медицинскими учреждениями документов такая информация также не содержится, как утверждают в СК, «ни в одном из предоставленных медицинскими учреждениями документов такая информация также не содержится"
//        let maintext = "Леонид: Кроме того, как утверждают в СК, «ни в одном из предоставленных медицинскими учреждениями документов такая информация также содержится». Кроме того, как утверждают в СК, «ни в одном из предоставленных медицинскими учреждениями документов такая информация также содержится» Кроме того, как утверждают в СК, «ни в одном из предоставленных медицинскими учреждениями документов такая информация также содержится»"
//        lbl.text = maintext
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 13)
        lbl.textColor = Colors.black
//        lbl.lineBreakMode = .byTruncatingTail
        
//        let paragraphStyle = NSMutableParagraphStyle()
//
//        paragraphStyle.lineSpacing = 1.8
//        let attrString = NSMutableAttributedString(string: maintext)
//        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
//
//        lbl.attributedText = attrString
        
//        let example = NSAttributedString(string: maintext).withLineSpacing(1.8)
//        lbl.attributedText = example
        
        return lbl
    }()
    
    let newAnswerLabel:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        lbl.text = "Новый ответ"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "SFProText-Regular", size: 13)
        lbl.textColor = Colors.darkBlue
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: MainDebateViewModel){
        firstPersonImageView.image = viewModel.firstUserPhoto
        secondPersonImageView.image = viewModel.secondUserPhoto
        firstNameLabel.text = viewModel.firstUserName
        secondNameLabel.text = viewModel.secondUserName
        themeLabel.text = viewModel.debateTheme
        mainThemeLabel.text = viewModel.titleDebate
        mainTextLabel.text = viewModel.mainTextDebate
        
        let lineSpacing = NSAttributedString(string: viewModel.mainTextDebate).withLineSpacing(1.8)
        mainTextLabel.attributedText = lineSpacing
    }
    
    
    func addSubViews(){
        [mainView,betweenCellSpaceView].forEach{self.contentView.addSubview($0)}
        [firstPersonImageView,secondPersonImageView,firstNameLabel,secondNameLabel,themeLabel,timeLabel,mainThemeLabel,mainTextLabel, newAnswerLabel].forEach{self.mainView.addSubview($0)}
    }

    func setConstraints(){
        
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mainView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        mainView.bottomAnchor.constraint(equalTo: betweenCellSpaceView.topAnchor, constant: 0).isActive = true
        
        betweenCellSpaceView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0).isActive = true
        betweenCellSpaceView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        betweenCellSpaceView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        betweenCellSpaceView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true

        firstPersonImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 13.5).isActive = true
        firstPersonImageView.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 15).isActive = true
        firstPersonImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstPersonImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondPersonImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 13.5).isActive = true
        secondPersonImageView.leftAnchor.constraint(equalTo: firstPersonImageView.rightAnchor,constant: 10).isActive = true
        secondPersonImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondPersonImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        firstNameLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        firstNameLabel.leftAnchor.constraint(equalTo: secondPersonImageView.rightAnchor,constant: 10).isActive = true
        firstNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        firstNameLabel.widthAnchor.constraint(equalToConstant: 167).isActive = true
        
        secondNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 0).isActive = true
        secondNameLabel.leftAnchor.constraint(equalTo: secondPersonImageView.rightAnchor,constant: 10).isActive = true
        secondNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        secondNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        themeLabel.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 0).isActive = true
        themeLabel.leftAnchor.constraint(equalTo: secondPersonImageView.rightAnchor,constant: 10).isActive = true
        //firstNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        themeLabel.widthAnchor.constraint(equalToConstant: 167).isActive = true
        
        timeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor,constant: -15).isActive = true
        //firstNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //timeLabel.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        mainThemeLabel.topAnchor.constraint(equalTo: firstPersonImageView.bottomAnchor, constant: 14.5).isActive = true
        mainThemeLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 15).isActive = true
        //firstNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //mainThemeLabel.widthAnchor.constraint(equalToConstant: 345).isActive = true
        mainThemeLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -15).isActive = true
        
        mainTextLabel.topAnchor.constraint(equalTo: mainThemeLabel.bottomAnchor, constant: 5).isActive = true
        mainTextLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor,constant: 15).isActive = true
        firstNameLabel.heightAnchor.constraint(equalToConstant: 82).isActive = true
        //mainTextLabel.widthAnchor.constraint(equalToConstant: 345).isActive = true
        mainTextLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -15).isActive = true
        
        newAnswerLabel.topAnchor.constraint(equalTo: mainTextLabel.bottomAnchor, constant: 10).isActive = true
        //newAnswerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 15).isActive = true
        //firstNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //mainTextLabel.widthAnchor.constraint(equalToConstant: 345).isActive = true
        newAnswerLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -18).isActive = true
        
    }

}

