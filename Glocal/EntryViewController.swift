//
//  EntryViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/15.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {

    var logoImage: UIImageView!
    var userButton: UIButton!
    var companyButton: UIButton!
    
    var isUser = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImage = UIImage(named: "background")
        self.view.backgroundColor = UIColor(patternImage: bgImage!)
        
        logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFit
        
        userButton = UIButton(type: .roundedRect)
        userButton.setTitleColor(UIColor.white, for: .normal)
        userButton.backgroundColor = ColorandFontTable.primaryGreen
        userButton.setTitle("Influencer", for: .normal)
        userButton.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        userButton.layer.masksToBounds = true
        userButton.layer.cornerRadius = 15
        userButton.addTarget(self, action: #selector(jumpToUser), for: .touchUpInside)
        
        companyButton = UIButton(type: .roundedRect)
        companyButton.setTitleColor(UIColor.white, for: .normal)
        companyButton.backgroundColor = ColorandFontTable.primaryGreen
        companyButton.setTitle("Company", for: .normal)
        companyButton.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        companyButton.layer.masksToBounds = true
        companyButton.layer.cornerRadius = 15
        companyButton.addTarget(self, action: #selector(jumpToCompany), for: .touchUpInside)
        
        view.addSubview(logoImage)
        view.addSubview(companyButton)
        view.addSubview(userButton)
        
        logoImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(120)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
            make.height.equalTo(self.view.snp.width).multipliedBy(0.4)
        }
        userButton.snp.makeConstraints { (make) in
            make.top.equalTo(logoImage.snp.bottom).offset(120)
            make.centerX.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
        }
        companyButton.snp.makeConstraints { (make) in
            make.top.equalTo(userButton.snp.bottom).offset(50)
            make.centerX.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
        }
    }
    @objc func jumpToUser() {
        UserDefaults.standard.set(true, forKey: "isUser")
        UserDefaults.standard.set(true, forKey: "isSelf")
        UserDefaults.standard.set(true, forKey: "Login")
        let avc = LoginViewController()
        self.navigationController?.pushViewController(avc, animated: true)
    }
    
    @objc func jumpToCompany() {
        UserDefaults.standard.set(false, forKey: "isUser")
        UserDefaults.standard.set(true, forKey: "isSelf")
        UserDefaults.standard.set(false, forKey: "Login")
        let avc = LoginViewController()
        self.navigationController?.pushViewController(avc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    

}
