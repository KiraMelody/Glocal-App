//
//  SearchViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/15.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit
import TextFieldEffects

class SearchViewController: UIViewController {
    
    var topLabel: UILabel!
    var suggestionLabel: UILabel!
    var firstLabel: UILabel!
    var secondLabel: UILabel!
    var thirdLabel: UILabel!
//    var platformLabel: UILabel!
    var countryField: HoshiTextField!
//    var industryField: HoshiTextField!
    var priceField: HoshiTextField!
//    var numberField: HoshiTextField!
//    var facebookButton: UIImageView!
//    var youtubeButton: UIImageView!
//    var linkedinButton: UIImageView!
//    var instagramButton: UIImageView!
    var startButton: UIButton!
    
    func initialize() {
        self.title = "Search Criteria"
        let textAttributes = [NSAttributedString.Key.foregroundColor: ColorandFontTable.primaryGreen]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = ColorandFontTable.darkGray
        self.navigationController?.navigationBar.isTranslucent = false
        var menu = UIImage(named: "menu")
        menu = menu?.withRenderingMode(.alwaysOriginal)
        let menuButton = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(openPanel))
        self.navigationItem.rightBarButtonItem = menuButton
        var back = UIImage(named: "back")
        back = back?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backToLast))
        self.navigationItem.leftBarButtonItem = backButton
        
        topLabel = UILabel()
        topLabel.text = "Invite local influencers \n to market your brand"
        topLabel.textAlignment = .center
        topLabel.font = .systemFont(ofSize: 24)
        topLabel.numberOfLines = 0
        
        suggestionLabel = UILabel()
        suggestionLabel.text = "Top 3 countries we suggest:"
        suggestionLabel.textAlignment = .center
        suggestionLabel.font = .systemFont(ofSize: 20)
        suggestionLabel.numberOfLines = 0
        
        firstLabel = UILabel()
        firstLabel.text = "Turkey"
        firstLabel.textAlignment = .center
        firstLabel.font = .systemFont(ofSize: 16)
        firstLabel.textColor = ColorandFontTable.primaryGreen
        firstLabel.clipsToBounds = true
        firstLabel.layer.masksToBounds = true
        firstLabel.layer.cornerRadius = 5
        firstLabel.layer.borderWidth = 1
        firstLabel.layer.borderColor = ColorandFontTable.primaryGreen.cgColor
        
        secondLabel = UILabel()
        secondLabel.text = "China"
        secondLabel.textAlignment = .center
        secondLabel.font = .systemFont(ofSize: 16)
        secondLabel.textColor = ColorandFontTable.primaryGreen
        secondLabel.clipsToBounds = true
        secondLabel.layer.masksToBounds = true
        secondLabel.layer.cornerRadius = 5
        secondLabel.layer.borderWidth = 1
        secondLabel.layer.borderColor = ColorandFontTable.primaryGreen.cgColor
        
        thirdLabel = UILabel()
        thirdLabel.text = "England"
        thirdLabel.textAlignment = .center
        thirdLabel.font = .systemFont(ofSize: 16)
        thirdLabel.textColor = ColorandFontTable.primaryGreen
        thirdLabel.clipsToBounds = true
        thirdLabel.layer.masksToBounds = true
        thirdLabel.layer.cornerRadius = 5
        thirdLabel.layer.borderWidth = 1
        thirdLabel.layer.borderColor = ColorandFontTable.primaryGreen.cgColor
        
        countryField = HoshiTextField()
        countryField.placeholder = "Target Country"
        countryField.borderInactiveColor = ColorandFontTable.borderGray
        countryField.borderActiveColor = ColorandFontTable.primaryGreen
        countryField.placeholderColor = ColorandFontTable.darkGray
        
        priceField = HoshiTextField()
        priceField.placeholder = "Price per post"
        priceField.borderInactiveColor = ColorandFontTable.borderGray
        priceField.borderActiveColor = ColorandFontTable.primaryGreen
        priceField.placeholderColor = ColorandFontTable.darkGray
        
//        facebookButton = UIImageView()
//        facebookButton.image = UIImage(named: "facebook")
//
//        youtubeButton = UIImageView()
//        youtubeButton.image = UIImage(named: "youtube")
//
//        linkedinButton = UIImageView()
//        linkedinButton.image = UIImage(named: "linkedin")
//
//        instagramButton = UIImageView()
//        instagramButton.image = UIImage(named: "instagram")
        
        startButton = UIButton(type: .roundedRect)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = ColorandFontTable.primaryGreen
        startButton.setTitle("Start Searching", for: .normal)
        startButton.layer.masksToBounds = true
        startButton.layer.cornerRadius = 5
        startButton.addTarget(self, action: #selector(jumpToMatch), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        self.view.backgroundColor = UIColor.white
        
        view.addSubview(topLabel)
        view.addSubview(suggestionLabel)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
//        view.addSubview(platformLabel)
        view.addSubview(countryField)
//        view.addSubview(industryField)
        view.addSubview(priceField)
//        view.addSubview(numberField)
//        view.addSubview(facebookButton)
//        view.addSubview(youtubeButton)
//        view.addSubview(linkedinButton)
//        view.addSubview(instagramButton)
        view.addSubview(startButton)
        
        topLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(30)
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.8)
        }
        suggestionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.7)
        }
        firstLabel.snp.makeConstraints { (make) in
            make.top.equalTo(suggestionLabel.snp.bottom).offset(10)
            make.right.equalTo(secondLabel.snp.left).offset(-10)
            make.width.equalTo(view).multipliedBy(0.2)
        }
        secondLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstLabel)
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.2)
        }
        thirdLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstLabel)
            make.left.equalTo(secondLabel.snp.right).offset(10)
            make.width.equalTo(view).multipliedBy(0.2)
        }
        countryField.snp.makeConstraints { (make) in
            make.top.equalTo(firstLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.height.equalTo(self.view).multipliedBy(0.1)
            make.width.equalTo(self.view).multipliedBy(0.5)
        }
//        industryField.snp.makeConstraints { (make) in
//            make.top.equalTo(countryField.snp.bottom)
//            make.centerX.equalTo(view)
//            make.height.equalTo(self.view).multipliedBy(0.1)
//            make.width.equalTo(self.view).multipliedBy(0.5)
//        }
        priceField.snp.makeConstraints { (make) in
            make.top.equalTo(countryField.snp.bottom)
            make.centerX.equalTo(view)
            make.height.equalTo(self.view).multipliedBy(0.1)
            make.width.equalTo(self.view).multipliedBy(0.5)
        }
//        numberField.snp.makeConstraints { (make) in
//            make.top.equalTo(priceField.snp.bottom)
//            make.centerX.equalTo(view)
//            make.height.equalTo(self.view).multipliedBy(0.1)
//            make.width.equalTo(self.view).multipliedBy(0.5)
//        }
//        platformLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(numberField.snp.bottom).offset(30)
//            make.centerX.equalTo(view)
//            make.width.equalTo(view).multipliedBy(0.8)
//        }
//        facebookButton.snp.makeConstraints { (make) in
//            make.top.equalTo(platformLabel.snp.bottom).offset(20)
//            make.left.equalTo(view).offset(100)
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
//            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
//        }
//        youtubeButton.snp.makeConstraints { (make) in
//            make.top.equalTo(facebookButton)
//            make.left.equalTo(facebookButton.snp.right).offset(20)
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
//            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
//        }
//        linkedinButton.snp.makeConstraints { (make) in
//            make.top.equalTo(facebookButton)
//            make.left.equalTo(youtubeButton.snp.right).offset(20)
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
//            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
//        }
//        instagramButton.snp.makeConstraints { (make) in
//            make.top.equalTo(facebookButton)
//            make.left.equalTo(linkedinButton.snp.right).offset(20)
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
//            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
//        }
        
        startButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.5)
            make.height.equalTo(30)
            make.bottom.equalTo(view).offset(-100)
        }

    }
    

    @objc func openPanel() {
        panel?.openLeft(animated: true)
    }
    @objc func backToLast() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    @objc func jumpToMatch() {
        UserDefaults.standard.set(false, forKey: "isSelf")
        let isUser = UserDefaults.standard.bool(forKey: "isUser")
        UserDefaults.standard.set(!isUser, forKey: "isUser")
        let avc = ResultTableViewController()
        self.navigationController?.pushViewController(avc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
