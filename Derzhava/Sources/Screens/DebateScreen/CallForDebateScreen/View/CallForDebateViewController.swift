//
//  CallForDebateViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 04.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import UIKit

class CallForDebateViewController: UIViewController {
    
    let titleTextView:UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        txt.backgroundColor = .none
        txt.text = "Заголовок дебатов"
        txt.textColor = UIColor.lightGray
        return txt
    }()
    
    let mainTextTextView:UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont(name: "SFProText-Regular", size: 17)
        txt.backgroundColor = .none
        txt.text = "Вставьте текст"
        txt.textColor = UIColor.lightGray
        return txt
    }()
    
    let scrollview:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view 
    }()
        
    let addPoliticianButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.white
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = Colors.background?.cgColor
        btn.addTarget(self, action: #selector(goToAddPoloticiansScreen), for: .touchUpInside)
        return btn
    }()
    
    let labelForAddPoliticianButton:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Выбрать политика для дебатов"
        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        lbl.textColor = Colors.darkBlue
        return lbl
    }()
    
    let chooseDataAndTimeButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.white
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = Colors.background?.cgColor
        btn.addTarget(self, action: #selector(goToChooseTimeAndPriceScreen), for: .touchUpInside)
        return btn
    }()
    
    let labelForChooseDataAndTimeButton:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Выбрать тему дебатов"
        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        lbl.textColor = Colors.darkBlue
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        
        setNavigationController()
        setTextView()
        addSubViews()
        setConstrains()
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Вызвать на дебаты", style: .plain, target: self, action: #selector(nothingHere))
        navigationItem.rightBarButtonItem?.tintColor = Colors.darkBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = Colors.black
    }
    
    @objc
    func nothingHere(){
        // Nothing
    }
    
    @objc
    func close(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func goToAddPoloticiansScreen(){
        let vc = AddPoliticiansViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func goToChooseTimeAndPriceScreen(){
        let vc = DebateThemeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addSubViews(){
        view.addSubview(scrollview)
        view.addSubview(addPoliticianButton)
        view.addSubview(chooseDataAndTimeButton)
        [titleTextView,mainTextTextView].forEach{self.scrollview.addSubview($0)}
        [labelForAddPoliticianButton].forEach{self.addPoliticianButton.addSubview($0)}
        [labelForChooseDataAndTimeButton].forEach{self.chooseDataAndTimeButton.addSubview($0)}
    }
    
    func setConstrains(){
        
        scrollview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: addPoliticianButton.topAnchor, constant: 0).isActive = true
                
        titleTextView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 20).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        titleTextView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        //ГЛАВНЫЙ
        mainTextTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 10).isActive = true
        mainTextTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        mainTextTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        mainTextTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addPoliticianButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -84).isActive = true
        addPoliticianButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        addPoliticianButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelForAddPoliticianButton.centerYAnchor.constraint(equalTo: addPoliticianButton.centerYAnchor, constant: 0).isActive = true
        labelForAddPoliticianButton.leftAnchor.constraint(equalTo: addPoliticianButton.leftAnchor, constant: 15).isActive = true
        
        chooseDataAndTimeButton.topAnchor.constraint(equalTo: addPoliticianButton.bottomAnchor, constant: 0).isActive = true
        chooseDataAndTimeButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        chooseDataAndTimeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelForChooseDataAndTimeButton.centerYAnchor.constraint(equalTo: chooseDataAndTimeButton.centerYAnchor, constant: 0).isActive = true
        labelForChooseDataAndTimeButton.leftAnchor.constraint(equalTo: chooseDataAndTimeButton.leftAnchor, constant: 15).isActive = true
    }
    
    func setTextView(){
        titleTextView.delegate = self
        titleTextView.isScrollEnabled = false
        //ГЛАВНЫЙ
        mainTextTextView.delegate = self
        mainTextTextView.isScrollEnabled = false
        
        self.titleTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        self.mainTextTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
    }
    
    func findOutTitleTextViewHeight() -> CGFloat{
        var a: CGFloat = 0
        a = titleTextView.intrinsicContentSize.height
        print("\nThis is title textview height - \(a)")
        return a
    }
    
    func findOutMainTextViewHeight() -> CGFloat{
        var a: CGFloat = 0
        a = mainTextTextView.intrinsicContentSize.height
        print("This is main textview height - \(a)")
        return a
    }
    
    @objc
    func tapDone(sender: Any) {
        self.view.endEditing(true)
    }

}

extension CallForDebateViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView){
        print(textView.text ?? "fail with typing text")

        scrollview.contentSize = CGSize(width: view.frame.width, height: 20 + findOutTitleTextViewHeight() + 10 + findOutMainTextViewHeight() + 100 + 200)
        
        print("SCROLL VIEW CONTENT SIZE HEIGHT IS - \(scrollview.contentSize.height)")
        
        let size = CGSize(width: view.frame.width - 30, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)

        textView.constraints.forEach{ (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == textView {
            if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = Colors.black
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {

        if textView.text.isEmpty {
            textView.text = "Вставьте текст статьи"
            textView.textColor = UIColor.lightGray
            
            if textView == titleTextView {
                textView.text = "Заголовок дебатов"
            } else {
                textView.text = "Вставьте текст"
            }
        }
        
    }
    
    
}
