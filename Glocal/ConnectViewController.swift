//
//  ConnectViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/14.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit
import KMPlaceholderTextView
import PKHUD

class ConnectViewController: UIViewController {

    var iconView: UIImageView!
    var textView: KMPlaceholderTextView!
    var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Send Message"
        let textAttributes = [NSAttributedString.Key.foregroundColor: ColorandFontTable.primaryGreen]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = ColorandFontTable.darkGray
        self.navigationController?.navigationBar.isTranslucent = false
        var back = UIImage(named: "back")
        back = back?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backToLast))
        self.navigationItem.leftBarButtonItem = backButton
        
        view.backgroundColor = ColorandFontTable.groundGray
        
        textView = KMPlaceholderTextView()
        textView.placeholder = "Hi, GymTime is a China based company sells fitness products, we want to extand our market globally. We hope you can help us market our brand in Turkey!"
        textView.font = UIFont.init(name: "Helvetica", size: 20)
        
        iconView = UIImageView()
        iconView.image = UIImage(named: "seray")
        
        submitButton = UIButton(type: .roundedRect)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.backgroundColor = ColorandFontTable.primaryGreen
        submitButton.setTitle("Submit", for: .normal)
        submitButton.layer.masksToBounds = true
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(getConnected), for: .touchUpInside)
        
        view.addSubview(textView)
        view.addSubview(iconView)
        view.addSubview(submitButton)
        
        iconView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(48)
            make.height.equalTo(48)
            make.top.equalTo(view).offset(50)
        }
        textView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(view).offset(-30)
            make.height.equalTo(300)
            make.top.equalTo(iconView.snp.bottom).offset(50)
        }
        submitButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.3)
            make.height.equalTo(30)
            make.bottom.equalTo(view).offset(-100)
        }
    }
    @objc func getConnected()
    {
        HUD.flash(.success, delay: 1.0)
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backToLast() {
        let _ = self.navigationController?.popViewController(animated: true)
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
