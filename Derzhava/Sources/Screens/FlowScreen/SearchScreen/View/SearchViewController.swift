//
//  SearchViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 18.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    let contentView = SearchScreenView()
    let searchController = UISearchController(searchResultsController: nil)
    
    var lastContentOffset: CGFloat = 0
    
    var labelArrat = ["Виталий Милонов","Иван Вокодавсакий","Антон Силуанов","Иван Вокодавсакий","Виталий Милонов","Иван Вокодавсакий","Антон Силуанов","Иван Вокодавсакий","Виталий Милонов","Иван Вокодавсакий","Антон Силуанов"]
    
    let imageArray:[UIImage] = [UIImage(named: "milonov")!,UIImage(named: "polit")!,UIImage(named: "sil")!,UIImage(named: "polit")!,UIImage(named: "milonov")!,UIImage(named: "polit")!,UIImage(named: "sil")!,UIImage(named: "polit")!,UIImage(named: "milonov")!,UIImage(named: "polit")!,UIImage(named: "sil")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        setNavigationController()
        setContentView()
        setTableView()
        setSegmentedControll()
    }
    
    override func loadView() {
        view = contentView
    }
    
    @objc
    func changeColor(){
        view.backgroundColor = .systemRed
        print("HAY CHANGE SEARCH")

    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        changeSegmentedControlLinePosition()
        self.contentView.tableview.reloadData()
    }
    
    // Change position of the underline
     func changeSegmentedControlLinePosition() -> CGFloat {
        let segmentIndex = CGFloat(contentView.segmentedControl.selectedSegmentIndex)
        let segmentWidth = contentView.segmentedControl.frame.width / CGFloat(contentView.segmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.contentView.leadingDistanceConstraint.constant = leadingDistance
        })
        print("Selected index is - \(segmentIndex)")
        return segmentIndex
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Поток"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = Colors.background
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.setValue("Назад", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = Colors.darkBlue
    }
    
    func setContentView(){
        contentView.segmentedControl.removeBorders()
        contentView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    func setTableView(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(ChangeSubjectTableViewCell.self, forCellReuseIdentifier: "ChangeSubjectTableViewCell")
        contentView.tableview.register(SearchNewsTableViewCell.self, forCellReuseIdentifier: "SearchNewsTableViewCell")
        contentView.tableview.rowHeight = 115
    }
    
    func setSegmentedControll(){
        // Constrain the segmented control to the container view
        NSLayoutConstraint.activate([
            contentView.segmentedControl.topAnchor.constraint(equalTo: contentView.segmentedControlContainerView.topAnchor),
            contentView.segmentedControl.leadingAnchor.constraint(equalTo: contentView.segmentedControlContainerView.leadingAnchor),
            contentView.segmentedControl.centerXAnchor.constraint(equalTo: contentView.segmentedControlContainerView.centerXAnchor),
            contentView.segmentedControl.centerYAnchor.constraint(equalTo: contentView.segmentedControlContainerView.centerYAnchor)
            ])

        // Constrain the underline view relative to the segmented control
        NSLayoutConstraint.activate([
            contentView.bottomUnderlineView.bottomAnchor.constraint(equalTo: contentView.segmentedControl.bottomAnchor),
            contentView.bottomUnderlineView.heightAnchor.constraint(equalToConstant: SearchScreenView.Constants.underlineViewHeight),
            contentView.leadingDistanceConstraint,
            contentView.bottomUnderlineView.widthAnchor.constraint(equalTo: contentView.segmentedControl.widthAnchor, multiplier: 1 / CGFloat(contentView.segmentedControl.numberOfSegments))
            ])
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelArrat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row % 2 {
        case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeSubjectTableViewCell") as? ChangeSubjectTableViewCell else {
                assertionFailure("ChangeSubjectTableViewCell is not available")
                return UITableViewCell()
            }
            cell.subjectLabel.text = labelArrat[indexPath.row]
            cell.photoImageView.image = imageArray[indexPath.row]
            cell.photoImageView.layer.cornerRadius = 37.5
            cell.photoImageView.contentMode = .scaleAspectFill
            return cell
        default:
                                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchNewsTableViewCell") as? SearchNewsTableViewCell else {
            assertionFailure("SearchNewsTableViewCell is not available")
            return UITableViewCell()
        }
            return cell
            
        }

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            // did move up
            print("\nMOVE DOWN")
            
            contentView.const.isActive = false
            contentView.const = contentView.segmentedControlContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
            contentView.const.isActive = true
            
            UIView.animate(withDuration: 0.01, delay: 0, options: .curveEaseIn, animations: {
                print("Hide")
                self.navigationController?.setNavigationBarHidden(true, animated: true)
            }, completion: nil)
            
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            // did move down
            print("\nMOVE UP")
            
            contentView.const.isActive = false
            contentView.const = contentView.segmentedControlContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
            contentView.const.isActive = true
            
            UIView.animate(withDuration: 0.18, delay: 0, options: .curveEaseIn, animations: {
                print("Hide")
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            }, completion: nil)

        } else {
            // didn't move
            print("\nDON'T MOOOOVE")
        }
    }
    
    
}
