//
//  TimeAndPriceForPublicationsViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 10.01.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import UIKit

class TimeAndPriceForPublicationsViewController: UIViewController {
    
    let contentView = TimeAndPriceForPublicationScreenView()
    
    let formatter:DateFormatter = {
        let form = DateFormatter()
        form.timeZone = .current
        form.locale = .current
        form.dateFormat = "dd.MM"
        return form
    }()
    
    let formatterHour:DateFormatter = {
        let form = DateFormatter()
        form.timeZone = .current
        form.locale = .current
        form.dateFormat = "HH:00"
        return form
    }()
    
    let formatterZeroHour:DateFormatter = {
        let form = DateFormatter()
        form.timeZone = .current
        form.locale = .current
        form.dateFormat = "HH"
        return form
    }()
    
    let today = Date()
    
    let tomorrow = Date().addingTimeInterval(86400)
    
    var selectedDay = String()
    
    let date = Date()
    
    var calendar = Calendar.current
    
    let price = ["2000","3000","9000","5000","8000","7000","4000","10000","4000","5000","3000","7000","8000"]
    
    
    let cornerView:UILabel = {
        let lbl = UILabel()
        lbl.text = "Выберите новую цену"
        lbl.font = UIFont(name: "SFProText-Regular", size: 15)
        return lbl
    }()
        
    public var complition: ((String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        
        setNavigationController()
        viewSettings()
        setTableView()
        pickerViewSettings()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func viewSettings(){
        contentView.tomorrowButtonForChooseView.addTarget(self, action: #selector(tomorrowButtonActions), for: .touchUpInside)
        contentView.todayButtonForChooseView.addTarget(self, action: #selector(todayButtonActions), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todayButtonActions()
    }
    
    func makeHours(number: [Int]) -> [Date] {
        var array = [Date]()
        
        for i in number {
            var dateComponent = DateComponents()
            dateComponent.hour = i
            let hour = Calendar.current.date(from: dateComponent) ?? Date()
            array.append(hour)
        }
        
        return array
    }
    
    @objc
    func todayButtonActions(){
        contentView.chooseTimeView.isHidden = false
        contentView.tableview.isHidden = false
        contentView.tableview.reloadData()
        contentView.todayButtonForChooseView.backgroundColor = Colors.darkBlue
        contentView.todayButtonForChooseView.setTitleColor(Colors.white, for: .normal)
        
        contentView.tomorrowButtonForChooseView.backgroundColor = Colors.background
        contentView.tomorrowButtonForChooseView.setTitleColor(Colors.black, for: .normal)
        
        selectedDay = formatter.string(from: today)
        print("\nSELECTED DAY (today) - \(selectedDay)")
    }
    
    @objc
    func tomorrowButtonActions(){
        contentView.chooseTimeView.isHidden = false
        contentView.tableview.isHidden = false
        contentView.tableview.reloadData()
        contentView.tomorrowButtonForChooseView.isSelected = true
        contentView.tomorrowButtonForChooseView.backgroundColor = Colors.darkBlue
        contentView.tomorrowButtonForChooseView.setTitleColor(Colors.white, for: .normal)
        
        contentView.todayButtonForChooseView.backgroundColor = Colors.background
        contentView.todayButtonForChooseView.setTitleColor(Colors.black, for: .normal)
        
        
        selectedDay = formatter.string(from: tomorrow)
        print("\nSELECTED DAY (tomorrow) - \(selectedDay)")
        
        if let timeZone = TimeZone(identifier: "Europe/Moscow") {
           calendar.timeZone = timeZone
        }
        
        let selectedHour = formatterHour.string(from: date)
        print("\nTHATS AN HOUR - \(selectedHour)")
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Подтвердить", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = Colors.darkBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = Colors.black
    }
    
    @objc
    func close(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func saveButtonTapped(){
        print("\nSO SELECTED DAY MUST BE - \(selectedDay)")
        complition?(selectedDay)
        self.navigationController?.popViewController(animated: true)
    }
    
    func pickerViewSettings(){
        contentView.pickerView.frame = CGRect(x: 15, y: view.frame.height / 2, width: view.frame.width - 30, height: 200)
        
        contentView.pickerView.delegate = self
        contentView.pickerView.dataSource = self
        
        cornerView.backgroundColor = .blue
        cornerView.frame = CGRect(x: 10, y: 5, width: 200, height: 20)
    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(ChooseDayForPublicationTableViewCell.self, forCellReuseIdentifier: "ChooseDayForPublicationTableViewCell")
        contentView.tableview.register(ChooseTimeAndPriceTableViewCell.self, forCellReuseIdentifier: "ChooseTimeAndPriceTableViewCell")
        contentView.tableview.register(MyCustomHeaderForFullNews.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeaderForFullNews")
    }

}

extension TimeAndPriceForPublicationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let arrayHours = [10,11,12,13,14,15,16,17,18,19,20,21,22]

        return arrayHours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseTimeAndPriceTableViewCell") as? ChooseTimeAndPriceTableViewCell else {
            assertionFailure("NewsTableViewCell is not available")
            return UITableViewCell()
        }
        
        let arrayHours = [10,11,12,13,14,15,16,17,18,19,20,21,22]
        
        let hours = makeHours(number: arrayHours)
                
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        cell.notAvailabelLabel.text = "\(price[indexPath.row]) РУБ"
        
        if selectedDay == formatter.string(from: tomorrow) {
            cell.notAvailabelLabel.text = "\(price[indexPath.row]) РУБ"
            cell.contentView.backgroundColor = Colors.white
            
        } else {
            
            print("\nNumber of free position for price is - \(22 - currentHour)")
            
            if arrayHours[indexPath.row] < currentHour + 1 {
                cell.notAvailabelLabel.text = "Недоступно"
                cell.contentView.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.8666666667, alpha: 1)
            } else {
                cell.contentView.backgroundColor = Colors.white
            }
        }

        cell.timeLabel.text = formatterHour.string(from: hours[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let arrayHours = [10,11,12,13,14,15,16,17,18,19,20,21,22]
                        
        let currentHour = Calendar.current.component(.hour, from: Date())

        if selectedDay == formatter.string(from: tomorrow) {
            return indexPath
        } else {
            if arrayHours[indexPath.row] < currentHour + 1 {
                return nil
            } else {
                return indexPath
            }
        }
 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

extension TimeAndPriceForPublicationsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return priceForPublication.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return priceForPublication[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.isHidden = true
        contentView.tableview.isUserInteractionEnabled = true
        contentView.todayButtonForChooseView.isUserInteractionEnabled = true
        contentView.tomorrowButtonForChooseView.isUserInteractionEnabled = true
    }
    
    
}
