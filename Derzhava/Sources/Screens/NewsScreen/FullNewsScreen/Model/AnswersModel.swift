//
//  AnswersModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 17.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

struct Answers {
    let photo:UIImage
    let namesurname:String
    let position:String
    let maintext:String
    let time:String
    
    init(photo:UIImage, namesurname:String, position:String, maintext:String, time:String) {
        self.photo = photo
        self.namesurname = namesurname
        self.position = position
        self.maintext = maintext
        self.time = time
    }
}
