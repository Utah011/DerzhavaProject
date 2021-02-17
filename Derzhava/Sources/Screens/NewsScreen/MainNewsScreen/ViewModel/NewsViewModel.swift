//
//  NewsViewModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 17.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class NewsViewModel {
    let photo:UIImage
    let logoofwriter:UIImage
    let newstitle:String
    let newstext:String
    let numberofallviews:String
    let signatureofwriter:String
    
//    init(newstitle:String, newstext:String, id:Int, photo:UIImage, logoofwriter:UIImage, numberofallviews:String, signatureofwriter:String) {
//        self.newstitle = newstitle
//        self.newstext = newstext
//        self.photo = photo
//        self.numberofallviews = numberofallviews
//        self.logoofwriter = logoofwriter
//        self.signatureofwriter = signatureofwriter
//    }
    
    init(with model: News) {
        photo = model.photo
        logoofwriter = model.logoofwriter
        newstitle = model.newstitle
        newstext = model.newstext
        numberofallviews = model.numberofallviews
        signatureofwriter = model.signatureofwriter
    }
}
