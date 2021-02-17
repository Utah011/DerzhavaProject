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
    
//    var const = NSLayoutConstraint()

    
    var labelArrat = ["Виталий Милонов","Иван Вокодавсакий","Антон Силуанов","Иван Вокодавсакий","Виталий Милонов","Иван Вокодавсакий","Антон Силуанов","Иван Вокодавсакий","Виталий Милонов","Иван Вокодавсакий","Антон Силуанов"]
    
    let imageArray:[UIImage] = [UIImage(named: "milonov")!,UIImage(named: "polit")!,UIImage(named: "sil")!,UIImage(named: "polit")!,UIImage(named: "milonov")!,UIImage(named: "polit")!,UIImage(named: "sil")!,UIImage(named: "polit")!,UIImage(named: "milonov")!,UIImage(named: "polit")!,UIImage(named: "sil")!]
    
//    let tableview:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .singleLine
//        table.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        return table
//    }()
//
//    private enum Constants {
//        static let segmentedControlHeight: CGFloat = 40
//        static let underlineViewColor: UIColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
//        static let underlineViewHeight: CGFloat = 2
//    }
//
//    // Container view of the segmented control
//    private lazy var segmentedControlContainerView: UIView = {
//        let containerView = UIView()
//        containerView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        return containerView
//    }()
//
//    // Customised segmented control
//    private lazy var segmentedControl: UISegmentedControl = {
//        let segmentedControl = UISegmentedControl()
//
//        // Remove background and divider colors
//        segmentedControl.backgroundColor = .clear
//        segmentedControl.tintColor = .clear
//
//        // Append segments
//        segmentedControl.insertSegment(withTitle: "Общее", at: 0, animated: true)
//        segmentedControl.insertSegment(withTitle: "Авторы", at: 1, animated: true)
//        segmentedControl.insertSegment(withTitle: "Дебаты", at: 2, animated: true)
//        segmentedControl.insertSegment(withTitle: "Новости", at: 3, animated: true)
//
//        // Select first segment by default
//        segmentedControl.selectedSegmentIndex = 0
//
//        // Change text color and the font of the NOT selected (normal) segment
//        segmentedControl.setTitleTextAttributes([
//            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1),
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)], for: .normal)
//
//        // Change text color and the font of the selected segment
//        segmentedControl.setTitleTextAttributes([
//            NSAttributedString.Key.foregroundColor: Constants.underlineViewColor,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
//
//        // Set up event handler to get notified when the selected segment changes
//        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
//
//        // Return false because we will set the constraints with Auto Layout
//        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//        return segmentedControl
//    }()
//
//    // The underline view below the segmented control
//    private lazy var bottomUnderlineView: UIView = {
//        let underlineView = UIView()
//        underlineView.backgroundColor = Constants.underlineViewColor
//        underlineView.translatesAutoresizingMaskIntoConstraints = false
//        return underlineView
//    }()
//
//    private lazy var leadingDistanceConstraint: NSLayoutConstraint = {
//        return bottomUnderlineView.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor)
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        setNavigationController()
        setContentView()
        setTableView()
//        addSubViews()
        setSegmentedControll()
//        setConstrains()
        
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
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.setValue("Назад", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
    }
    
//    func addSubViews(){
//        view.addSubview(segmentedControlContainerView)
//        view.addSubview(tableview)
//        segmentedControlContainerView.addSubview(segmentedControl)
//        segmentedControlContainerView.addSubview(bottomUnderlineView)
//    }
    
//    func setConstrains(){
//        let constr = segmentedControlContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
//        constr.isActive = true
//        segmentedControlContainerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        segmentedControlContainerView.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight).isActive = true
//
//        tableview.topAnchor.constraint(equalTo: segmentedControlContainerView.bottomAnchor, constant: 0).isActive = true
//        tableview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }
    
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
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeSubjectTableViewCell") as? ChangeSubjectTableViewCell else {
//            assertionFailure("ChangeSubjectTableViewCell is not available")
//            return UITableViewCell()
//        }
//        cell.subjectLabel.text = labelArrat[indexPath.row]
//        cell.photoImageView.image = imageArray[indexPath.row]
//
//        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            // did move up
            print("\nMOVE DOWN")
            //navigationController?.navigationBar.backgroundColor = .red
            
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
            //navigationController?.navigationBar.backgroundColor = .green
            
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
