//
//  EternalQuestionsViewModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 17.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class EternalQuestionsViewModel {
    let title:String
    let mainText:String
    
    init(with model: EternalQuestions){
        title = model.title
        mainText = model.maintext
    }
}
