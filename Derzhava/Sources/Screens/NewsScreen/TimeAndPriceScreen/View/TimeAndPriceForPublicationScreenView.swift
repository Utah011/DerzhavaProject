//
//  TimeAndPriceForPublicationScreenView.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 15.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

class TimeAndPriceForPublicationScreenView: UIView {
    
    let tableview = UITableView()
    let chooseADayView = UIView()
    let titleForChooseView = UILabel()
    let todayButtonForChooseView = UIButton()
    let tomorrowButtonForChooseView = UIButton()
    let chooseTimeView = UIView()
    let titleForTimeView = UILabel()
    let pickerView = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .singleLine
        addSubview(tableview)
        
        chooseADayView.translatesAutoresizingMaskIntoConstraints = false
        chooseADayView.backgroundColor = Colors.background
        addSubview(chooseADayView)

        titleForChooseView.translatesAutoresizingMaskIntoConstraints = false
        titleForChooseView.text = "ВЫБЕРИТЕ ДЕНЬ"
        titleForChooseView.font = UIFont(name: "SFProText-Regular", size: 17)
        titleForChooseView.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1)
        chooseADayView.addSubview(titleForChooseView)

        todayButtonForChooseView.translatesAutoresizingMaskIntoConstraints = false
        todayButtonForChooseView.setTitle("Сегодня", for: .normal)
        todayButtonForChooseView.setTitleColor(Colors.black, for: .normal)
        todayButtonForChooseView.clipsToBounds = true
        todayButtonForChooseView.layer.cornerRadius = 15
        todayButtonForChooseView.backgroundColor = Colors.background
        chooseADayView.addSubview(todayButtonForChooseView)

        tomorrowButtonForChooseView.translatesAutoresizingMaskIntoConstraints = false
        tomorrowButtonForChooseView.setTitle("Завтра", for: .normal)
        tomorrowButtonForChooseView.setTitleColor(Colors.black, for: .normal)
        tomorrowButtonForChooseView.clipsToBounds = true
        tomorrowButtonForChooseView.layer.cornerRadius = 15
        tomorrowButtonForChooseView.backgroundColor = Colors.background
        chooseADayView.addSubview(tomorrowButtonForChooseView)


        chooseTimeView.translatesAutoresizingMaskIntoConstraints = false
        chooseTimeView.backgroundColor = Colors.background
        chooseTimeView.isHidden = true
        addSubview(chooseTimeView)
        
        titleForTimeView.translatesAutoresizingMaskIntoConstraints = false
        titleForTimeView.text = "ВЫБЕРИТЕ ВРЕМЯ"
        titleForTimeView.font = UIFont(name: "SFProText-Regular", size: 17)
        titleForTimeView.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1)
        chooseTimeView.addSubview(titleForTimeView)
        
        pickerView.isHidden = true
        pickerView.backgroundColor = .orange
        pickerView.layer.cornerRadius = 16
        addSubview(pickerView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        chooseADayView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        chooseADayView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        chooseADayView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        chooseTimeView.topAnchor.constraint(equalTo: chooseADayView.bottomAnchor, constant: 0).isActive = true
        chooseTimeView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        chooseTimeView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        tableview.topAnchor.constraint(equalTo: chooseTimeView.bottomAnchor, constant: 0).isActive = true
        tableview.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        tableview.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        tableview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        //
        titleForChooseView.topAnchor.constraint(equalTo: chooseADayView.topAnchor, constant: 30).isActive = true
        titleForChooseView.leftAnchor.constraint(equalTo: chooseADayView.leftAnchor, constant: 10).isActive = true
        
        todayButtonForChooseView.topAnchor.constraint(equalTo: titleForChooseView.bottomAnchor, constant: 15).isActive = true
        todayButtonForChooseView.leftAnchor.constraint(equalTo: chooseADayView.leftAnchor, constant: 48).isActive = true
        todayButtonForChooseView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        todayButtonForChooseView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        tomorrowButtonForChooseView.topAnchor.constraint(equalTo: titleForChooseView.bottomAnchor, constant: 15).isActive = true
        tomorrowButtonForChooseView.rightAnchor.constraint(equalTo: chooseADayView.rightAnchor, constant: -48).isActive = true
        tomorrowButtonForChooseView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tomorrowButtonForChooseView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //
        titleForTimeView.topAnchor.constraint(equalTo: chooseTimeView.topAnchor, constant: 30).isActive = true
        titleForTimeView.leftAnchor.constraint(equalTo: chooseTimeView.leftAnchor, constant: 10).isActive = true
    }

}
