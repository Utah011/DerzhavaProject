//
//  MakeATwitViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 04.02.2021.
//  Copyright © 2021 Andrew Kolbasov. All rights reserved.
//

import UIKit

class MakeATwitViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let scrollview:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .orange
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        img.image = UIImage(named: "Калининградская область")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let twitTextView:UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont(name: "SFProText-Regular", size: 17)
        txt.backgroundColor = .none
        txt.text = "Напишите твит"
        txt.textColor = UIColor.lightGray
        return txt
    }()
    
    let twitImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .green
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
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
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    let numberOfCharactersLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0/500"
        lbl.font = UIFont(name: "SFProText-Regular", size: 12)
        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        return lbl
    }()
    
    var allcon:[NSLayoutConstraint] = []
    
    var allconb:[NSLayoutConstraint] = []
    
    let imagePicker:UIImagePickerController = {
        let ip = UIImagePickerController()
        return ip
    }()
    
    var heightConstraintForTwitImageView = NSLayoutConstraint()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        setNavigationController()
        setTextView()
        addSubViews()
        setConstrains()
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Создать", style: .plain, target: self, action: #selector(nothingHere))
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
    
    func addSubViews(){
        view.addSubview(scrollview)
        [numberOfCharactersLabel,userImageView,twitTextView,twitImageView,deleteImageButton].forEach{self.scrollview.addSubview($0)}
    }
    
    func setConstrains(){
                
        scrollview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        numberOfCharactersLabel.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 10).isActive = true
        numberOfCharactersLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        userImageView.topAnchor.constraint(equalTo: twitTextView.topAnchor, constant: 4).isActive = true
        userImageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        twitTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 61).isActive = true
        twitTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -14).isActive = true
        twitTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let con1 = twitImageView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 30)
        let con2 = twitImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60)
        let con3 = twitImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        let con4 = twitImageView.heightAnchor.constraint(equalToConstant: 5)
        let contoptext = twitTextView.topAnchor.constraint(equalTo: twitImageView.bottomAnchor, constant: 10)
        allcon = [con1,con2,con3,con4,contoptext]
        NSLayoutConstraint.activate(allcon)
        
        let con5 = twitImageView.topAnchor.constraint(equalTo: twitTextView.bottomAnchor, constant: 21)
        let con6 = twitImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60)
        let con7 = twitImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        let con8 = twitImageView.heightAnchor.constraint(equalToConstant: 5)
        let contoptext2 = twitTextView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 45)
        allconb = [con5,con6,con7,con8,contoptext2]
        
        deleteImageButton.topAnchor.constraint(equalTo: twitImageView.topAnchor, constant: 10).isActive = true
        deleteImageButton.rightAnchor.constraint(equalTo: twitTextView.rightAnchor, constant: -10).isActive = true
        deleteImageButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        deleteImageButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setTextView(){
        twitTextView.delegate = self
        twitTextView.isScrollEnabled = false
        
        self.twitTextView.openGallaryButton(title: "Прикрепить изображение", target: self, selector: #selector(openGallery))
    }
    
    @objc
    func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    func findOutTwitTextViewHeight() -> CGFloat{
        var a: CGFloat = 0
        a = twitTextView.intrinsicContentSize.height
        print("\nThis is title textview height - \(a)")
        return a
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
          twitImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        twitImageView.isHidden = false
        deleteImageButton.isHidden = false
        
        heightConstraintForTwitImageView.constant = 170
        heightConstraintForTwitImageView = twitImageView.heightAnchor.constraint(equalToConstant: 170)
        view.addConstraint(heightConstraintForTwitImageView)
        
        self.twitTextView.openGallaryButton(title: "Изображение прикреплено", target: self, selector: #selector(nothingHere))
        twitTextView.resignFirstResponder()
      }
    
    @objc
    func deleteImageAction(){
        twitImageView.isHidden = true
        deleteImageButton.isHidden = true
        heightConstraintForTwitImageView.constant = 10
        
        self.twitTextView.openGallaryButton(title: "Прикрепить изображение", target: self, selector: #selector(openGallery))
        twitTextView.resignFirstResponder()
    }

}

extension MakeATwitViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView){
        print(textView.text ?? "fail with typing text")
        
        let currentNumberOfCharacters = textView.text.count
        numberOfCharactersLabel.text = "\(currentNumberOfCharacters)/500"
        if currentNumberOfCharacters > 500 {
            numberOfCharactersLabel.textColor = .red
        } else {
            numberOfCharactersLabel.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        }

        scrollview.contentSize = CGSize(width: view.frame.width, height: 30 + findOutTwitTextViewHeight() + 21 + 100 + 200 + 250)
        
        print("SCROLL VIEW CONTENT SIZE HEIGHT IS - \(scrollview.contentSize.height)")
        
        let size = CGSize(width: view.frame.width - 76, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)

        textView.constraints.forEach{ (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
        
        if twitTextView.text.count < 14 && heightConstraintForTwitImageView.constant < 150 {
            NSLayoutConstraint.deactivate(allconb)
            NSLayoutConstraint.activate(allcon)
        } else if heightConstraintForTwitImageView.constant < 150 {
            NSLayoutConstraint.deactivate(allcon)
            NSLayoutConstraint.activate(allconb)
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
            textView.text = "Напишите твит"
            textView.textColor = UIColor.lightGray
        }
        
    }
}
