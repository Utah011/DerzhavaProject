//
//  AnswersViewModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 17.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class AnswersViewModel {
    let photo:UIImage
    let namesurname:String
    let position:String
    let maintext:String
    let time:String
    
    init(with model: Answers ) {
        self.photo = model.photo
        self.namesurname = model.namesurname
        self.position = model.position
        self.maintext = model.maintext
        self.time = model.time
    }
}

