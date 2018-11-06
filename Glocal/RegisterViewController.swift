//
//  RegisterViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/3.
//  Copyright © 2018年 KiraMelody. All rights reserved.
//

import UIKit
import SnapKit
import TextFieldEffects

class RegisterViewController: UIViewController {
    
    var logoImage: UIImageView!
    var appLabel: UILabel!
    var usernameField: HoshiTextField!
    var emailField: HoshiTextField!
    var passwordField: HoshiTextField!
    var conpasswordField: HoshiTextField!
    var registerButton: UIButton!
    var facebookButton: UIImageView!
    var youtubeButton: UIImageView!
    var linkedinButton: UIImageView!
    var instagramButton: UIImageView!
    var width, height: CGFloat!
    
    func initialize() {
        
        width = view.frame.width
        height = view.frame.height
        print(width, height)
        
        logoImage = UIImageView()
        logoImage.image = UIImage(named: "global")
        logoImage.contentMode = .scaleAspectFit
        
        appLabel = UILabel()
        appLabel.font = UIFont(name: "Helvetica-Bold", size: 28)
        appLabel.text = "Glocal"
        appLabel.textAlignment = .center
        appLabel.textColor = ColorandFontTable.darkGray
        
        usernameField = HoshiTextField()
        usernameField.placeholder = "Username"
        usernameField.borderInactiveColor = ColorandFontTable.borderGray
        usernameField.borderActiveColor = ColorandFontTable.primaryGreen
        usernameField.placeholderColor = ColorandFontTable.darkGray
        
        emailField = HoshiTextField()
        emailField.placeholder = "Email"
        emailField.borderInactiveColor = ColorandFontTable.borderGray
        emailField.borderActiveColor = ColorandFontTable.primaryGreen
        emailField.placeholderColor = ColorandFontTable.darkGray
        
        passwordField = HoshiTextField()
        passwordField.placeholder = "Password"
        passwordField.borderInactiveColor = ColorandFontTable.borderGray
        passwordField.borderActiveColor = ColorandFontTable.primaryGreen
        passwordField.placeholderColor = ColorandFontTable.darkGray
        
        conpasswordField = HoshiTextField()
        conpasswordField.placeholder = "Confirmed Password"
        conpasswordField.borderInactiveColor = ColorandFontTable.borderGray
        conpasswordField.borderActiveColor = ColorandFontTable.primaryGreen
        conpasswordField.placeholderColor = ColorandFontTable.darkGray
        
        registerButton = UIButton(type: .roundedRect)
        registerButton.setTitle("Sign Up", for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        registerButton.addTarget(self, action: #selector(RegisterViewController.jumpToProfile), for: .touchUpInside)
        registerButton.backgroundColor = ColorandFontTable.primaryGreen
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 15
        registerButton.clipsToBounds = true
        
        facebookButton = UIImageView()
        facebookButton.image = UIImage(named: "facebook")
        
        youtubeButton = UIImageView()
        youtubeButton.image = UIImage(named: "youtube")
        
        linkedinButton = UIImageView()
        linkedinButton.image = UIImage(named: "linkedin")
        
        instagramButton = UIImageView()
        instagramButton.image = UIImage(named: "instagram")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        self.view.addSubview(logoImage)
        self.view.addSubview(appLabel)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(conpasswordField)
        self.view.addSubview(registerButton)
//        self.view.addSubview(facebookButton)
//        self.view.addSubview(youtubeButton)
//        self.view.addSubview(linkedinButton)
//        self.view.addSubview(instagramButton)
        
        self.view.backgroundColor = ColorandFontTable.lightGreen
        
        logoImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.4)
            make.height.equalTo(self.view.snp.width).multipliedBy(0.4)
        }
        appLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImage.snp.bottom).offset(10)
            make.centerX.equalTo(self.view)
        }
        usernameField.snp.makeConstraints { (make) in
            make.top.equalTo(appLabel.snp.bottom).offset(30)
            make.centerX.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.1)
            make.width.equalTo(self.view).multipliedBy(0.7)
        }
        emailField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameField.snp.bottom).offset(5)
            make.centerX.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.1)
            make.width.equalTo(self.view).multipliedBy(0.7)
        }
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(emailField.snp.bottom).offset(5)
            make.centerX.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.1)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
        }
        conpasswordField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(5)
            make.centerX.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.1)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
        }
        registerButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
        }
//        facebookButton.snp.makeConstraints { (make) in
//            make.bottom.equalTo(self.view).offset(-80)
//            make.left.equalTo(self.view).offset(80)
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
//            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
//        }
//        youtubeButton.snp.makeConstraints { (make) in
//            make.bottom.equalTo(self.view).offset(-80)
//            make.left.equalTo(facebookButton.snp.right).offset(20)
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
//            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
//        }
//        linkedinButton.snp.makeConstraints { (make) in
//            make.bottom.equalTo(self.view).offset(-80)
//            make.left.equalTo(youtubeButton.snp.right).offset(20)
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
//            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
//        }
//        instagramButton.snp.makeConstraints { (make) in
//            make.bottom.equalTo(self.view).offset(-80)
//            make.left.equalTo(linkedinButton.snp.right).offset(20)
//            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
//            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
//        }
    }
    
    func makeGroundImageView(groundImage:UIImage!) -> UIImageView {
        let newUIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: height * 0.4875, height: height * 0.09))
        newUIImageView.image = groundImage
        return newUIImageView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
//    @objc func register() {
//        let url = URL(string: "\(APIurl)/signup")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("user=567ajsdgfhkjhawegr", forHTTPHeaderField: "Cookie")
//        request.httpBody = ("{" + token + " \"email\": \"\(emailTextFieldWithCheck.textField.text!)\",   \"username\": \"\(usernameTextFieldWithCheck.textField.text!)\",  \"password\": \"\(passwordTextFieldWithCheck.textField.text!)\"}").data(using: .utf8)
//        print(request)
//        let cookie = HTTPCookie(properties: [
//            HTTPCookiePropertyKey.name:"Cookie",
//            HTTPCookiePropertyKey.value:"user=fsfsdfsdfsfef",
//            HTTPCookiePropertyKey(rawValue: "httpOnly"): "false",
//            HTTPCookiePropertyKey.secure: "isSecure",
//            HTTPCookiePropertyKey.path:"/",
//            HTTPCookiePropertyKey.domain: APIurl])
//        let storage = HTTPCookieStorage.shared
//        storage.setCookies([cookie!], for: URL(string: APIurl) , mainDocumentURL: nil)
//        let cookieArray = storage.cookies!
//        for cookie in cookieArray
//        {
//            print("name:\(cookie.name),value:\(cookie.value)")
//        }
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let _ = response, let _ = data {
//                DispatchQueue.main.async(execute: { () -> Void in
//                    self.backToLast()
//                })
//                print("has successfully signed up")
//            } else {
//                print(error!)
//            }
//        }
//        
//        task.resume()
//    }
    
    @objc func backToLast() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @objc func jumpToProfile() {
        let avc = ProfileViewController()
        self.navigationController?.pushViewController(avc, animated: true)
    }
    
//    func recheck() {
//        if passwordField.textField.text != repasswordTextFieldWithCheck.textField.text {
//            conpasswordField.checkHidden = true
//            conpasswordField.correctImageView.isHidden = true
//        }
//    }
}

//extension RegisterViewController: CheckDelegate {
//    func validate(index: Int, text: String) {
//        switch index {
//        case 1:
//            if text != "" {
//                emailTextFieldWithCheck.checkHidden = !validateEmail(email: text)
//            }
//        case 2:
//            if text != "" {
//                usernameTextFieldWithCheck.checkHidden = false
//            }
//        case 3:
//            if text != "" {
//                passwordTextFieldWithCheck.checkHidden = false
//                self.recheck()
//            }
//        default:
//            if text != "" {
//                repasswordTextFieldWithCheck.checkHidden = false
//                self.recheck()
//            }
//        }
//    }
//}

func validateEmail(email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailTest.evaluate(with: email)
}
