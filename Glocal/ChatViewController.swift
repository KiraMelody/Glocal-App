//
//  ChatViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/14.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit
import GrowingTextView

class ChatViewController: UIViewController {

    var iconView: UIImageView!
    var footView: UIView!
    var instructionLabel: UILabel!
    var messageView: UIView!
    var messageLabel: UILabel!
    var functionButton: UIButton!
    var textView: GrowingTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorandFontTable.groundGray
        let textAttributes = [NSAttributedString.Key.foregroundColor: ColorandFontTable.primaryGreen]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = ColorandFontTable.darkGray
        self.navigationController?.navigationBar.isTranslucent = false
        var coin = UIImage(named: "coin")
        coin = coin?.withRenderingMode(.alwaysOriginal)
        let coinButton = UIBarButtonItem(image: coin, style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = coinButton
        var back = UIImage(named: "back")
        back = back?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backToLast))
        self.navigationItem.leftBarButtonItem = backButton
        
        footView = UIView()
        footView.backgroundColor = ColorandFontTable.darkGray
        
        instructionLabel = UILabel()
        instructionLabel.text = "Start chat with Gymtime"
        instructionLabel.textColor = ColorandFontTable.borderGray
        instructionLabel.numberOfLines = 0
        
        messageView = UIView()
        messageView.backgroundColor = ColorandFontTable.lightGreen
        messageView.layer.cornerRadius = 20
        messageView.layer.masksToBounds = true
        
        messageLabel = UILabel()
        messageLabel.text = "Hi, GymTime is a China based company sells fitness products, we want to extand our market globally. We hope you can help us market our brand in Turkey!"
        messageLabel.font = UIFont.init(name: "Helvetica", size: 16)
        messageLabel.numberOfLines = 0
        messageLabel.backgroundColor = UIColor.clear
        
        textView = GrowingTextView()
        textView.font = UIFont.init(name: "Helvetica", size: 16)
        textView.layer.cornerRadius = 5
        textView.layer.masksToBounds = true
        
        functionButton = UIButton()
        functionButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        
        iconView = UIImageView()
        iconView.image = UIImage(named: "gym")
        
        messageView.addSubview(messageLabel)
        footView.addSubview(textView)
        footView.addSubview(functionButton)
        
        view.addSubview(messageView)
        view.addSubview(instructionLabel)
        view.addSubview(iconView)
        view.addSubview(footView)
        
        iconView.snp.makeConstraints { (make) in
            make.right.equalTo(view).offset(-20)
            make.width.equalTo(48)
            make.height.equalTo(48)
            make.top.equalTo(view).offset(70)
        }
        messageView.snp.makeConstraints { (make) in
            make.top.equalTo(messageLabel).offset(-10)
            make.left.equalTo(messageLabel).offset(-10)
            make.right.equalTo(messageLabel).offset(10)
            make.bottom.equalTo(messageLabel).offset(10)
        }
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView)
            make.width.lessThanOrEqualTo(view).multipliedBy(0.5)
            make.right.equalTo(iconView.snp.left).offset(-30)
        }
        instructionLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.height.equalTo(20)
            make.top.equalTo(view).offset(20)
        }
        footView.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.top.equalTo(textView).offset(-10)
            make.bottom.equalTo(view)
        }
        textView.snp.makeConstraints { (make) in
            make.left.equalTo(footView).offset(20)
            make.right.equalTo(functionButton.snp.left).offset(-20)
            make.bottom.equalTo(footView).offset(-20)
        }
        functionButton.snp.makeConstraints { (make) in
            make.right.equalTo(footView).offset(-20)
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.bottom.equalTo(footView).offset(-25)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "GymTime"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc func backToLast() {
        let _ = self.navigationController?.popViewController(animated: true)
    }

}
