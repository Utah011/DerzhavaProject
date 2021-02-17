//
//  DebateViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 02.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//


//Переопределить все методы , написать их корректно!
import UIKit
//import TinyConstraints



class DebateViewController: UIViewController, UIScrollViewDelegate {
    
    let contentView = DebateScreenView()
    var lastContentOffset: CGFloat = 0
//    var col = NSLayoutConstraint()
    
    var selectedIndex: IndexPath?

    
//    let collectionThemeView:UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 15
//        layout.scrollDirection = .horizontal
//        let clv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        clv.translatesAutoresizingMaskIntoConstraints = false
//        clv.backgroundColor = UIColor(red: 249, green: 249, blue: 249, alpha: 0)
//        clv.showsHorizontalScrollIndicator = false
//        return clv
//    }()
//
//    let tableThemeView:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
//        table.isScrollEnabled = true
//        table.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
//        return table
//    }()
//
//    let titleLabelForNavController:UILabel = {
//        let lbl = UILabel()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.text = "Дебаты"
//        lbl.font = UIFont(name: "SFProDisplay-Bold", size: 34)
//        lbl.textColor = .black
//        return lbl
//    }()
    
//    let debateCell = DebateTableViewCell()
//    let nc = NotificationCenter.default

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
//        print("Heith of text is - \(debateCell.mainTextLabel.frame.height)")
        exampleAnswers()
        setNavigationController()
//        addSubViews()
        setCollectionView()
        setTableView()
//        setConstrains()
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            arrayOfThemes.insert("Ответы", at: 0)
            print("YOU ARE IN!")
        }
        
    }
    
    override func loadView() {
        view = contentView
    }
    
    @objc
    func goToCallForDebateScreen(){
        let editingVC = CallForDebateViewController()
        self.navigationController?.pushViewController(editingVC, animated: true)
    }

        
//    func addSubViews(){
//        [titleLabelForNavController,collectionThemeView,tableThemeView].forEach{self.view.addSubview($0)}
//    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        navigationController?.navigationBar.shadowImage = UIImage(named: "nav")
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        navigationItem.rightBarButtonItem?.title = "События"
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Вызвать на дебаты", style: .plain, target: self, action: #selector(goToCallForDebateScreen))
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "События", style: .plain, target: self, action: #selector(goToDebateEventsScreen))
            print("YOU ARE IN!")
        }
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
    }
    
    @objc
    func nothingHere(){
        
    }
    
//    func setConstrains(){
//
//        let col = collectionThemeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
//        col.isActive = true
//        collectionThemeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        collectionThemeView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        collectionThemeView.heightAnchor.constraint(equalToConstant: 38).isActive = true
//
//        titleLabelForNavController.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
//        titleLabelForNavController.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        titleLabelForNavController.bottomAnchor.constraint(equalTo: collectionThemeView.topAnchor, constant: -21).isActive = true
//
//        tableThemeView.topAnchor.constraint(equalTo: collectionThemeView.bottomAnchor, constant: 20).isActive = true
//        tableThemeView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        tableThemeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//
//    }
    
    func setCollectionView(){
        contentView.collectionThemeView.delegate = self
        contentView.collectionThemeView.dataSource = self
        contentView.collectionThemeView.register(DebateCollectionViewCell.self, forCellWithReuseIdentifier: "DebateCollectionViewCell")
    }
    
    func setTableView(){
        contentView.tableThemeView.delegate = self
        contentView.tableThemeView.dataSource = self
        contentView.tableThemeView.register(DebateTableViewCell.self, forCellReuseIdentifier: "DebateTableViewCell")
        //tableThemeView.rowHeight = 200
    }
    
    @objc
    func goToDebateEventsScreen(){
        let defaulVC = DebateEventsViewController()
        self.navigationController?.pushViewController(defaulVC, animated: true)
    }
    
    func findOutLabelLength(indexPath: IndexPath) -> CGFloat{
        var a: CGFloat = 0
        let p = arrayOfThemes[indexPath.row]
        print("\nPart of arrayOfThemes - \(p)")
        let b = DebateCollectionViewCell()
        b.firstSubjectLabel.text = p
        a = b.firstSubjectLabel.intrinsicContentSize.width
        print("This is text lenght \(a)")
        return a
    }
    
}

extension DebateViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfThemes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DebateCollectionViewCell", for: indexPath) as! DebateCollectionViewCell
        cell.firstSubjectLabel.text = arrayOfThemes[indexPath.row]
        
        if indexPath == selectedIndex {
            cell.firstSubjectLabel.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
            cell.firstSubjectLabel.textColor = . white
        } else {
            cell.firstSubjectLabel.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
            cell.firstSubjectLabel.textColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset.left = 20
        collectionView.contentInset.right = 20

        return CGSize(width: findOutLabelLength(indexPath: indexPath) + 22, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        print(selectedIndex)
        collectionView.reloadData()
    }
    
}

extension DebateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDebateArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let debateModel = mainDebateArray[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DebateTableViewCell") as? DebateTableViewCell else {
            assertionFailure("DebateTableViewCell is not available")
            return UITableViewCell()
        }
        
        cell.configure(with: MainDebateViewModel(with: debateModel))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let defaulVC = FullDebateViewController()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "hideObjects"), object: nil)
        self.navigationController?.pushViewController(defaulVC, animated: true)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            // did move up
            print("\nMOVE DOWN")
            //navigationController?.navigationBar.backgroundColor = .red
            
            contentView.titleLabelForNavController.isHidden = true
            
            contentView.col.isActive = false
            contentView.col = contentView.collectionThemeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
            contentView.col.isActive = true

            UIView.animate(withDuration: 0.01, delay: 0, options: .curveEaseIn, animations: {
                print("Hide")
                self.navigationController?.setNavigationBarHidden(true, animated: true)
            }, completion: nil)

        } else if self.lastContentOffset > scrollView.contentOffset.y {
            // did move down
            print("\nMOVE UP")
            //navigationController?.navigationBar.backgroundColor = .green
            
            contentView.titleLabelForNavController.isHidden = false

            contentView.col.isActive = false
            contentView.col = contentView.collectionThemeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
            self.contentView.col.isActive = true

            UIView.animate(withDuration: 0.01, delay: 0, options: .curveEaseIn, animations: {
                print("Hide")
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            }, completion: nil)

        } else {
            // didn't move
            print("\nDON'T MOOOOVE")
        }
    }
}

