//
//  MainDebateModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 18.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit


struct MainDebateModel {
    let firstUserPhoto:UIImage
    let secondUserPhoto:UIImage
    let firstUserName:String
    let secondUserName:String
    let debateTheme:String
    let titleDebate:String
    let mainTextDebate:String
    
    init(firstUserPhoto:UIImage, secondUserPhoto:UIImage, firstUserName:String, secondUserName:String, debateTheme:String, titleDebate:String, mainTextDebate:String) {
        self.firstUserPhoto = firstUserPhoto
        self.secondUserPhoto = secondUserPhoto
        self.firstUserName = firstUserName
        self.secondUserName = secondUserName
        self.debateTheme = debateTheme
        self.titleDebate = titleDebate
        self.mainTextDebate = mainTextDebate
    }
}

var arrayOfThemes:[String] = ["Подписки","Горячее","Полиция","Общество","Экономика","Медицина","Культура","Происшествия"]
