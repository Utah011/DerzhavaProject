//
//  EternalQuestionsScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 15.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class EternalQuestionsScreenView: UIView {
    
    var collectionViewEternalQuestions: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .vertical
        
        collectionViewEternalQuestions = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewEternalQuestions.translatesAutoresizingMaskIntoConstraints = false
        collectionViewEternalQuestions.backgroundColor = Colors.background
        collectionViewEternalQuestions.showsHorizontalScrollIndicator = false
        addSubview(collectionViewEternalQuestions)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionViewEternalQuestions.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionViewEternalQuestions.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true
        collectionViewEternalQuestions.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}
