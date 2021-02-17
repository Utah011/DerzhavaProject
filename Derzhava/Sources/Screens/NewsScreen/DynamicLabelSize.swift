//
//  DynamicLabelSize.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 07.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import  UIKit

class DynamicLabelSize {
    static func height(text:String?, font:UIFont, width:CGFloat) -> CGFloat {
        let currentHeight: CGFloat!
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.text = text
        label.font = font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        currentHeight = label.frame.height
        label.removeFromSuperview()
        
        return currentHeight
    }
}
