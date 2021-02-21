//
//  FullInformationAboutUserViewController.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 06.12.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import UIKit

class FullInformationAboutUserViewController: UIViewController {

    let contentView = FullInformationAboutUserScreenView()
    var statement = false
    var checkMarkSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.background
        exampleAnswers()
        setNavigationController()
        tableViewSettings()
        setContentView()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setContentView(){
        contentView.segmentedControl.removeBorders()
        contentView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        contentView.veryficationButton.addTarget(self, action: #selector(verificationButtonTap(_:)), for: .allTouchEvents)
    }
    
    func tableViewSettings(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        contentView.tableview.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeader")
        contentView.tableview.tableHeaderView = contentView.myViewHeader
    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Профиль"
        //navigationController?.navigationBar.shadowImage = UIImage(named: "sepatarenLineForNavCtrl")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "infoIcon"), style: .plain, target: self, action: #selector(goToFullInfoAboutAuthor))
        navigationItem.rightBarButtonItem?.tintColor = Colors.black
        
        navigationController?.navigationBar.backgroundColor = Colors.background
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = Colors.darkBlue
    }
    
    @objc
    func verificationButtonTap(_ sender:UIButton){

        if statement {
            statement = false
            contentView.veryficationButton.setImage(UIImage(named: "followlogo"), for: .normal)
        } else {
            statement = true
            contentView.veryficationButton.setImage(UIImage(named: "addfollowlogo"), for: .normal)
        }
    }
    

    
    @objc
    func goToFullInfoAboutAuthor(){
        let defaultVC = FullInfoAboutAuthorViewController()
        self.navigationController?.pushViewController(defaultVC, animated: true)
    }

    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        changeSegmentedControlLinePosition()
        self.contentView.tableview.reloadData()
    }
    
    //MAIN HERE

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
    
    func heightForView(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 31, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    

    
    }

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image!
    }
}

extension FullInformationAboutUserViewController:UITableViewDelegate, UITableViewDataSource {
    
//START CHANGE FROM HERE
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyCustomHeader") as! MyCustomHeader
        
        switch changeSegmentedControlLinePosition() {
        case 0:
            UIView.self
        case 1:
            UIView.self
        default:
            if section == 0{
            view.title.text = "hohohohoh"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            view.image.image = UIImage(named: "polit")
            } else {
            view.title.text = "Завершенные"
            view.title.font = UIFont(name: "SFProDisplay-Bold", size: 22)
            }
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch changeSegmentedControlLinePosition() {
        case 0:
            return 0
        case 1:
            return 0
        default:
            if section == 0 {
                return 0
            } else {
                return 78
            }
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch changeSegmentedControlLinePosition() {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows = 1
        
        switch changeSegmentedControlLinePosition() {
        case 0:
            numberOfRows = newsArray.count
            print("First array - \(newsArray.count)")
        case 1:
            numberOfRows = 2
            print("Third array - \(answersArray.count)")
        default:
            
            if section == 0 {
                numberOfRows = 2
            } else {
                numberOfRows = 3
            }
            print("Second array - \(answersArray.count)")
        }
        print(numberOfRows)
        return numberOfRows
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let fontForTitleLabel = UIFont(name: "SFProDisplay-Semibold", size: 20) else {
            assertionFailure("\nfontForMainText is not available")
            return 0
        }
        
        let heightOfTitleText = heightForView(text: newsArray[indexPath.row].newstitle, font: fontForTitleLabel)
        
        switch changeSegmentedControlLinePosition() {
        case 0:
            return 374 + heightOfTitleText + 58
        case 1:
            if indexPath.row % 2 == 0 {
                return 680
            } else {
                return 430
            }
        default:
            return 200
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsModel = newsArray[indexPath.row]
        let secondAnswerModel = secondAnswersArray[indexPath.row]
        let twitModel = twitArray[indexPath.row]
        let debateModel = mainDebateArray[indexPath.row]
        
        switch changeSegmentedControlLinePosition() {
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
                assertionFailure("NewsTableViewCell is not available")
                return UITableViewCell()
            }
                    cell.selectionStyle = .none
            
            cell.configure(with: NewsViewModel(with: newsModel))
            
            if flag == 1 {
                cell.writerLogoImageView.image = UIImage(named: "polit")
            } else {
                cell.writerLogoImageView.image = UIImage(named: "riabiglogo")
            }
            
            cell.bottomOfTheCellLabel.isHidden = false
            cell.askToAnswerButtom.isHidden = true
            
            return cell
            
        case 1:
            if indexPath.row % 2 == 0 {
                tableView.register(PositionTableViewCell.self, forCellReuseIdentifier: "PositionTableViewCell")
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PositionTableViewCell") as? PositionTableViewCell else {
                    assertionFailure("PositionTableViewCell is not available")
                    return UITableViewCell()
                }
                cell.photoImageView.image = secondAnswersArray[indexPath.row].photo
                cell.nameLabel.text = secondAnswersArray[indexPath.row].namesurname
                cell.mainTextLabel.text = secondAnswersArray[indexPath.row].maintext
                
                cell.secondPhotoImageView.image = answersArray[indexPath.row].photo
                cell.secondNameLabel.text = answersArray[indexPath.row].namesurname
                
                return cell
            } else {
                tableView.register(TwitsCell.self, forCellReuseIdentifier: "TwitsCell")
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwitsCell") as? TwitsCell else {
                    assertionFailure("TwitsCell is not available")
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
                cell.configure(with: TwitViewModel(view: twitModel))
                
                return cell
            }
        default:
            tableView.register(DebateTableViewCell.self, forCellReuseIdentifier: "DebateTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DebateTableViewCell") as? DebateTableViewCell else {
                assertionFailure("DebateTableViewCell is not available")
                return UITableViewCell()
            }
            cell.configure(with: MainDebateViewModel(with: debateModel))
            return cell
        }
    
    }

}

class MyCustomHeader: UITableViewHeaderFooterView {
    let title:UILabel = {
        let tlt = UILabel()
        tlt.translatesAutoresizingMaskIntoConstraints = false
        tlt.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        return tlt
    }()
    let image = UIImageView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false

        //contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.backgroundColor = Colors.background

        // Center the image vertically and place it near the leading
        // edge of the view. Constrain its width and height to 50 points.
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30)
        ])
    }
}


