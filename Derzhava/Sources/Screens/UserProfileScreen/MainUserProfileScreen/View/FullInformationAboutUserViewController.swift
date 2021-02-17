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
//
////        if flag == 1 {
////            segmentedControl.insertSegment(withTitle: "Новости", at: 0, animated: true)
////            segmentedControl.insertSegment(withTitle: "Дебаты", at: 1, animated: true)
////            segmentedControl.insertSegment(withTitle: "Позиция", at: 2, animated: true)
////        } else {
////            segmentedControl.insertSegment(withTitle: "Новости", at: 0, animated: true)
////            segmentedControl.insertSegment(withTitle: "Позиция", at: 2, animated: true)
////        }
//
//        segmentedControl.insertSegment(withTitle: "Новости", at: 0, animated: true)
//        segmentedControl.insertSegment(withTitle: "Позиция", at: 1, animated: true)
//        segmentedControl.insertSegment(withTitle: "Дебаты", at: 2, animated: true)
//
//        if flag != 1 {
//            segmentedControl.removeSegment(at: 2, animated: true)
//        }
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
//
//    let justview: UIView = {
//        let jv = UIView()
//        jv.translatesAutoresizingMaskIntoConstraints = false
//        jv.backgroundColor = .systemBlue
//        return jv
//    }()
//
//    let tableview:UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
//        table.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        return table
//    }()
//
//    let topView:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        return view
//    }()
//
//    let logoImageView:UIImageView = {
//        let img = UIImageView()
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.layer.masksToBounds = true
//        img.clipsToBounds = true
//
//        if flag == 1 {
//            img.image = UIImage(named: "polit")
//        } else {
//            img.image = UIImage(named: "riabiglogo")
//        }
//
//        img.layer.cornerRadius = 50
//        img.contentMode = .scaleAspectFill
//        return img
//    }()
//
//    let veryficationButton:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.layer.masksToBounds = true
//        //img.image = UIImage(named: "followlogo")
//        btn.setImage(UIImage(named: "addfollowlogo"), for: .normal)
////        btn.addTarget(self, action: #selector(verificationButtonTap(_:)), for: .allTouchEvents)
//        return btn
//    }()
    
    var statement = false
    var checkMarkSelected = 0

//
//    let nameLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.numberOfLines = 1
//        if flag == 1 {
//            lbl.text = "Денис Мантуров"
//        } else {
//            lbl.text = "РИА"
//        }
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
//        lbl.textColor = .black
//        lbl.lineBreakMode = .byTruncatingTail
//        return lbl
//    }()
//
//    let positionLabel:UILabel = {
//        let lbl = UILabel()
//        lbl.numberOfLines = 2
//        lbl.textAlignment = .center
//
//
//        if flag == 1 {
//            lbl.text = "Министр промышленности и торговли Российской Федерации"
//        } else {
//            lbl.text = "Русскоязычное интернет-издание"
//        }
//
////        lbl.text = "Министр промышленности и торговли Российской Федерации"
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        lbl.font = UIFont(name: "SFProText-Regular", size: 13)
//        lbl.textColor = #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5568627451, alpha: 1)
//        lbl.lineBreakMode = .byWordWrapping
//        return lbl
//    }()
//
//    let myViewHeader:UIView = {
//        let view = UIView()
//        //view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
//        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 273)
//        //view.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
//        //view.layer.borderWidth = 0.5
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        exampleAnswers()
        setNavigationController()
        tableViewSettings()
        setContentView()
//        addSubviews()
//        setSegmentedControll()
//        setConstrains()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setContentView(){
        contentView.segmentedControl.removeBorders()
        contentView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        contentView.veryficationButton.addTarget(self, action: #selector(verificationButtonTap(_:)), for: .allTouchEvents)
    }
    
//    func addSubviews(){
//        view.addSubview(tableview)
//        myViewHeader.addSubview(logoImageView)
//        myViewHeader.addSubview(veryficationButton)
//        myViewHeader.addSubview(nameLabel)
//        myViewHeader.addSubview(positionLabel)
//        myViewHeader.addSubview(segmentedControlContainerView)
//        segmentedControlContainerView.addSubview(segmentedControl)
//        segmentedControlContainerView.addSubview(bottomUnderlineView)
//    }
    
    func tableViewSettings(){
        contentView.tableview.delegate = self
        contentView.tableview.dataSource = self
        contentView.tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        contentView.tableview.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: "MyCustomHeader")
        contentView.tableview.tableHeaderView = contentView.myViewHeader
    }
    
//    func setConstrains(){
//
//        logoImageView.topAnchor.constraint(equalTo: myViewHeader.topAnchor, constant: 30).isActive = true
//        logoImageView.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor).isActive = true
//        logoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        veryficationButton.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: 70).isActive = true
//        veryficationButton.leftAnchor.constraint(equalTo: logoImageView.leftAnchor, constant: 70).isActive = true
//        veryficationButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        veryficationButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
//
//        nameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10).isActive = true
//        nameLabel.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor).isActive = true
//
//        positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
//        positionLabel.centerXAnchor.constraint(equalTo: myViewHeader.centerXAnchor).isActive = true
//        positionLabel.widthAnchor.constraint(equalTo: myViewHeader.widthAnchor).isActive = true
//
//        segmentedControlContainerView.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 18).isActive = true
//        segmentedControlContainerView.widthAnchor.constraint(equalTo: myViewHeader.widthAnchor).isActive = true
//        segmentedControlContainerView.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight).isActive = true
//
//        tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        tableview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }
//
//    func setSegmentedControll(){
//        // Constrain the segmented control to the container view
//        NSLayoutConstraint.activate([
//            segmentedControl.topAnchor.constraint(equalTo: segmentedControlContainerView.topAnchor),
//            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor),
//            segmentedControl.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
//            segmentedControl.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor)
//            ])
//
//        // Constrain the underline view relative to the segmented control
//        NSLayoutConstraint.activate([
//            bottomUnderlineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
//            bottomUnderlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
//            leadingDistanceConstraint,
//            bottomUnderlineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
//            ])
//    }
    
    func setNavigationController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Профиль"
        //navigationController?.navigationBar.shadowImage = UIImage(named: "sepatarenLineForNavCtrl")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "infoIcon"), style: .plain, target: self, action: #selector(goToFullInfoAboutAuthor))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9607843137, alpha: 1)
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.2509803922, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
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
//            if section == 0 {
//                numberOfRows = 1
//            } else {
//                numberOfRows = 3
//            }
//            print("Second array - \(answersArray.count)")
        
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
        switch changeSegmentedControlLinePosition() {
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
                assertionFailure("NewsTableViewCell is not available")
                return UITableViewCell()
            }
                    cell.selectionStyle = .none
            
//            cell.photoImageView.image = newsArray[indexPath.row].photo
//            cell.nameLabel.text = newsArray[indexPath.row].newstitle
//            cell.adressLabel.text = newsArray[indexPath.row].newstext
//            cell.numverOfViews.text = newsArray[indexPath.row].numberofallviews
            cell.configure(with: NewsViewModel(with: newsModel))
            
            if flag == 1 {
                cell.writerLogoImageView.image = UIImage(named: "polit")
            } else {
                cell.writerLogoImageView.image = UIImage(named: "riabiglogo")
            }
            
//            cell.writerLogoImageView.image = newsArray[indexPath.row].logoofwriter
//            cell.bottomOfTheCellLabel.text = newsArray[indexPath.row].signatureofwriter
            
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
                
                
//                if flag == 1 {
//                    cell.secondPhotoImageView.image = UIImage(named: "polit")
//                } else {
//                    cell.secondPhotoImageView.image = UIImage(named: "riabiglogo")
//                }
//
//                if flag == 1 {
//                    cell.secondNameLabel.text = "Денис Мантуров"
//                } else {
//                    cell.secondNameLabel.text = "РИА"
//                }
                
                return cell
            } else {
                tableView.register(TwitsCell.self, forCellReuseIdentifier: "TwitsCell")
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TwitsCell") as? TwitsCell else {
                    assertionFailure("TwitsCell is not available")
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
                
                
//                if flag == 1 {
//                    cell.photoImageView.image = UIImage(named: "polit")
//                } else {
//                    cell.photoImageView.image = UIImage(named: "riabiglogo")
//                }
////                cell.photoImageView.image = answersArray[indexPath.row].photo
//
//                if flag == 1 {
//                    cell.nameLabel.text = "Денис Мантуров"
//                } else {
//                    cell.nameLabel.text = "РИА"
//                }

//                cell.newsImageView.image = newsArray[indexPath.row].photo
                cell.configure(with: TwitViewModel(view: twitModel))
                
                
                return cell
            }
        default:
            tableView.register(DebateTableViewCell.self, forCellReuseIdentifier: "DebateTableViewCell")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DebateTableViewCell") as? DebateTableViewCell else {
                assertionFailure("DebateTableViewCell is not available")
                return UITableViewCell()
            }

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
        contentView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)

        // Center the image vertically and place it near the leading
        // edge of the view. Constrain its width and height to 50 points.
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //title.heightAnchor.constraint(equalToConstant: 60),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30)
        ])
    }
}


