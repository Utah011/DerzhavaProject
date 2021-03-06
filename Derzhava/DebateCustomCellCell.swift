//
//  woife.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 13.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

//import Foundation
//import UIKit
//class CustomCellCell: UICollectionViewCell {
//    
//    var data: CustomDataData? {
//        didSet {
//            guard let data = data else { return }
//            bg.image = data.backgroundImage
//            nameSurnameLabel.text = data.title
//            
//        }
//    }
//    
//    fileprivate let bg: UIImageView = {
//       let iv = UIImageView()
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFill
//        iv.clipsToBounds = true
////        iv.layer.cornerRadius = iv.frame.size.width / 2
//        iv.layer.cornerRadius = 22
//        return iv
//    }()
//    
//    lazy var nameSurnameLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.numberOfLines = 2
//        lbl.textAlignment = .center
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.font = UIFont(name: "SFProText-Regular", size: 11)
//        lbl.textColor = .black
//        lbl.lineBreakMode = .byTruncatingTail
////        lbl.backgroundColor = .blue
//        return lbl
//    }()
//    
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        
//
//
//        
//        contentView.addSubview(bg)
//        contentView.addSubview(nameSurnameLabel)
//
//        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
//        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        
//        nameSurnameLabel.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 10).isActive = true
//        nameSurnameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        nameSurnameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
////        nameSurnameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//}
//}
