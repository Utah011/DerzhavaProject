//
//  MakeNewsViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 31.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit
import RealmSwift

class MakeNewsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    let realm = try! Realm()
    
    var heightConstraintForTitle = NSLayoutConstraint()

    let loadImageButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.backgroundColor = Colors.background
        btn.layer.borderColor = Colors.darkBlue?.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
        return btn
    }()

    let imageForLoadButton:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "loadimagearrow")
        return img
    }()

    let labelForLoadButton:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Загрузить изображение"
        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        lbl.textColor = Colors.darkBlue
        return lbl
    }()
    
    let imagePicker:UIImagePickerController = {
        let ip = UIImagePickerController()
        return ip
    }()
    
    var newsImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        img.backgroundColor = Colors.background
        img.contentMode = .scaleAspectFill
        img.isHidden = true
        return img
    }()

    let deleteImageButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "deleteimageicon"), for: .normal)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(deleteImageAction), for: .touchUpInside)
        return btn
    }()

    let titleTextView:UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        txt.backgroundColor = .none
        txt.text = "Напишите заголовок"
        txt.textColor = UIColor.lightGray
        return txt
    }()

    let mainTextTextView:UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont(name: "SFProText-Regular", size: 17)
        txt.backgroundColor = .none
        txt.text = "Вставьте текст статьи"
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
        lbl.text = "Добавить политиков (макс. 5)"
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
        lbl.text = "Выбрать дату и время публикации"
        lbl.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        lbl.textColor = Colors.darkBlue
        return lbl
    }()
    
    
    var finalSelectedDay = String()
    
    let vc = TimeAndPriceForPublicationsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background

        setNavigationController()
        setTextView()
        addSubViews()
        setConstrains()
        self.titleTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        self.mainTextTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        
        print("\nFINAL SELECTED DAY IS  - \(finalSelectedDay)")
        
        let path = realm.configuration.fileURL?.path
        print(String(describing: path))
    }
    
    @objc
    func goToChooseTimeAndPriceScreen(){
        let vc = TimeAndPriceForPublicationsViewController()
        
        vc.complition = { [weak self] text in
            self?.finalSelectedDay = text ?? "\nOH NO MAN"
            print("final selected day is gonna be - \(self?.finalSelectedDay ?? "fail with complition and selectedDay")")
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func goToAddPoloticiansScreen(){
        let vc = AddPoliticiansViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func tapDone(sender: Any) {
        
        if heightConstraintForTitle.constant > 100 {
        self.view.frame.origin.y = 0
        }
        
        self.view.endEditing(true)
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Создать", style: .plain, target: self, action: #selector(SaveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = Colors.darkBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = Colors.black
    }
    
    func addSubViews(){
        view.addSubview(scrollview)
        view.addSubview(addPoliticianButton)
        view.addSubview(chooseDataAndTimeButton)
        [loadImageButton,newsImageView,deleteImageButton,titleTextView,mainTextTextView].forEach{self.scrollview.addSubview($0)}
        [imageForLoadButton,labelForLoadButton].forEach{self.loadImageButton.addSubview($0)}
        [labelForAddPoliticianButton].forEach{self.addPoliticianButton.addSubview($0)}
        [labelForChooseDataAndTimeButton].forEach{self.chooseDataAndTimeButton.addSubview($0)}
    }
    
    func setConstrains(){

        scrollview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: addPoliticianButton.topAnchor, constant: 0).isActive = true

        loadImageButton.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 20).isActive = true
        loadImageButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        loadImageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        loadImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        imageForLoadButton.topAnchor.constraint(equalTo: loadImageButton.topAnchor, constant: 15).isActive  = true
        imageForLoadButton.leftAnchor.constraint(equalTo: loadImageButton.leftAnchor, constant: 60).isActive = true
        imageForLoadButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageForLoadButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        labelForLoadButton.centerYAnchor.constraint(equalTo: loadImageButton.centerYAnchor, constant: 0).isActive = true
        labelForLoadButton.leftAnchor.constraint(equalTo: imageForLoadButton.rightAnchor, constant: 11).isActive = true

        deleteImageButton.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 30).isActive = true
        deleteImageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        deleteImageButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        deleteImageButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        newsImageView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 18).isActive = true
        newsImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        newsImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        titleTextView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 20).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        titleTextView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
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
    
    func heightForView(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 30, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    func setTextView(){
        titleTextView.delegate = self
        titleTextView.isScrollEnabled = false
        //ГЛАВНЫЙ
        mainTextTextView.delegate = self
        mainTextTextView.isScrollEnabled = false
    }
    
    @objc
    func nothingHereMethod(){
        
    }
    
    @objc
    func close(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func deleteImageAction(){
        loadImageButton.isHidden = false
        newsImageView.isHidden = true
        deleteImageButton.isHidden = true
        heightConstraintForTitle.constant = 50
    }
    
    @objc
    func openGallery(){
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          imagePicker.dismiss(animated: true, completion: nil)
          newsImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        loadImageButton.isHidden = true
        newsImageView.isHidden = false
        deleteImageButton.isHidden = false
        
        heightConstraintForTitle.constant = 195
        heightConstraintForTitle = newsImageView.heightAnchor.constraint(equalToConstant: 195)
        view.addConstraint(heightConstraintForTitle)
      }
    
    @objc
    func SaveButtonTapped(){
        
        guard let title = titleTextView.text, title != "Напишите заголовок" else {
            let alert = UIAlertController(title: "Ой!", message: "Пожалуйста, введите заголовок для новости", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true)
            print("stop man")
            return
        }

        guard let mainText = mainTextTextView.text, mainText != "Вставьте текст статьи" else {
            let alert = UIAlertController(title: "Ой!", message: "Пожалуйста, введите текст для новости", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true)
            print("stop man")
            return
        }
        
        guard let photo = newsImageView.image, photo != nil && heightConstraintForTitle.constant > 100 else {
            let alert = UIAlertController(title: "Ой!", message: "Пожалуйста, выберите фотографию для новости", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true)
            print("stop man")
            return
        }
        
        let selectedDay = finalSelectedDay
        
        
        let vc = AuthorSettingsScreenView()
        let newPost = AddPost(title: titleTextView.text, mainText: mainTextTextView.text, photo: newsImageView.image?.pngData() as! NSData, selectedDay: selectedDay)
        
        try! self.realm.write {
            self.realm.add(newPost)
            vc.tableview.reloadData()
        }
        print("\njust: \(finalSelectedDay)")
        
        
        self.navigationController?.popViewController(animated: true)

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

}

extension MakeNewsViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView){
        print(textView.text ?? "fail with typing text")

        scrollview.contentSize = CGSize(width: view.frame.width, height: 20 + 200 + 20 + findOutTitleTextViewHeight() + 10 + findOutMainTextViewHeight() + 100 + 200)
        
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
                textView.text = "Напишите заголовок"
            } else {
                textView.text = "Вставьте текст статьи"
            }
        }
        
    }
    
    
}
