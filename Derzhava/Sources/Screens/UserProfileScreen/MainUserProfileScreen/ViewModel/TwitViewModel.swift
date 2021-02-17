//
//  TwitViewModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 17.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class TwitViewModel{
    let photoOfUser:UIImage
    let name:String
    let newsPhoto:UIImage
    let time:String
    let twitText:String
    
    init(view model: Twit){
        photoOfUser = model.photoOfUser
        name = model.name
        newsPhoto = model.newsPhoto
        time = model.time
        twitText = model.twitText
    }
}
