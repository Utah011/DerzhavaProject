//
//  MainDebateViewModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 18.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class MainDebateViewModel {
    let firstUserPhoto:UIImage
    let secondUserPhoto:UIImage
    let firstUserName:String
    let secondUserName:String
    let debateTheme:String
    let titleDebate:String
    let mainTextDebate:String
    
    init(with model: MainDebateModel){
        firstUserPhoto = model.firstUserPhoto
        secondUserPhoto = model.secondUserPhoto
        firstUserName = model.firstUserName
        secondUserName = model.secondUserName
        debateTheme = model.debateTheme
        titleDebate = model.titleDebate
        mainTextDebate = model.mainTextDebate
    }
}
