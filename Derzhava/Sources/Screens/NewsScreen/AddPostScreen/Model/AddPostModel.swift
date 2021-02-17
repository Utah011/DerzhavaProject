//
//  AddPostModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 18.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

@objcMembers class AddPost: Object{
    
    dynamic var title:String? = nil
    dynamic var mainText:String? = nil
    dynamic var photo: NSData? = nil
    dynamic var selectedDay:String? = nil
    dynamic var selectedTime:Date? = nil
    
    convenience init(title: String, mainText: String, photo: NSData, selectedDay: String){
        self.init()
        self.title = title
        self.mainText = mainText
        self.photo = photo
        self.selectedDay = selectedDay
    }
}

let priceForPublication = ["1000","2000","4000","6000","8000","10000","15000","20000","25000","30000"]

