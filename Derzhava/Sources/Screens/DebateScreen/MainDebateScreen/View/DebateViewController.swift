//
//  DebateViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 02.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//


import UIKit

class DebateViewController: UIViewController, UIScrollViewDelegate {
    
    let contentView = DebateScreenView()
    var lastContentOffset: CGFloat = 0
    var selectedIndex: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        exampleAnswers()
        setNavigationController()
        setCollectionView()
        setTableView()
        
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
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = Colors.background
        navigationController?.navigationBar.shadowImage = UIImage(named: "navShadowImage")
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = Colors.darkBlue
        navigationItem.rightBarButtonItem?.title = "События"
        
        if UserDefaults.standard.bool(forKey: "isUserLoggedIn"){
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Вызвать на дебаты", style: .plain, target: self, action: #selector(goToCallForDebateScreen))
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "События", style: .plain, target: self, action: #selector(goToDebateEventsScreen))
            print("YOU ARE IN!")
        }
        navigationItem.leftBarButtonItem?.tintColor = Colors.darkBlue
        navigationItem.rightBarButtonItem?.tintColor = Colors.darkBlue
    }
    
    @objc
    func nothingHere(){
        
    }
    
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
            cell.firstSubjectLabel.backgroundColor = Colors.darkBlue
            cell.firstSubjectLabel.textColor = . white
        } else {
            cell.firstSubjectLabel.backgroundColor = Colors.background
            cell.firstSubjectLabel.textColor = Colors.darkBlue
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

