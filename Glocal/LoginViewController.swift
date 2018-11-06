//
//  LoginViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/3.
//  Copyright © 2018年 KiraMelody. All rights reserved.
//

import UIKit
import SnapKit
import TextFieldEffects

class LoginViewController: UIViewController {

    var logoImage: UIImageView!
    var appLabel: UILabel!
    var usernameField: HoshiTextField!
    var passwordField: HoshiTextField!
    var loginButton: UIButton!
    var registerButton: UIButton!
    var facebookButton: UIImageView!
    var youtubeButton: UIImageView!
    var linkedinButton: UIImageView!
    var instagramButton: UIImageView!
    var width, height: CGFloat!
    
    func initialize() {

        width = view.frame.width
        height = view.frame.height
        
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
        
        passwordField = HoshiTextField()
        passwordField.placeholder = "Password"
        passwordField.borderInactiveColor = ColorandFontTable.borderGray
        passwordField.borderActiveColor = ColorandFontTable.primaryGreen
        passwordField.placeholderColor = ColorandFontTable.darkGray
        
        loginButton = UIButton(type: .roundedRect)
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(LoginViewController.jumpToHomepage), for: .touchUpInside)
        loginButton.backgroundColor = ColorandFontTable.primaryGreen
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.clipsToBounds = true
        
        registerButton = UIButton(type: .roundedRect)
        registerButton.setTitle("Sign Up", for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        registerButton.addTarget(self, action: #selector(LoginViewController.jumpToRegister), for: .touchUpInside)
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
        self.view.addSubview(passwordField)
        self.view.addSubview(loginButton)
        self.view.addSubview(registerButton)
        self.view.addSubview(facebookButton)
        self.view.addSubview(youtubeButton)
        self.view.addSubview(linkedinButton)
        self.view.addSubview(instagramButton)
        
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
            make.top.equalTo(appLabel.snp.bottom).offset(50)
            make.centerX.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.1)
            make.width.equalTo(self.view).multipliedBy(0.7)
        }
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameField.snp.bottom).offset(5)
            make.centerX.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.1)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
        }
        loginButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(registerButton.snp.top).offset(-20)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
        }
        registerButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(facebookButton.snp.top).offset(-50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.7)
        }
        facebookButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-80)
            make.left.equalTo(self.view).offset(80)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
        }
        youtubeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-80)
            make.left.equalTo(facebookButton.snp.right).offset(20)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
        }
        linkedinButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-80)
            make.left.equalTo(youtubeButton.snp.right).offset(20)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
        }
        instagramButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-80)
            make.left.equalTo(linkedinButton.snp.right).offset(20)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.1)
            make.height.equalTo(self.view.snp.width).multipliedBy(0.1)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.white]
//        self.navigationController?.navigationBar.backgroundColor = ColorandFontTable.primaryGreen
//        self.navigationController?.navigationBar.barTintColor = ColorandFontTable.tintGreen
//        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Touch event
    @objc func login(){
        //懒得等加载
        UserDefaults.standard.set(usernameField.text!, forKey: "USERNAME")
        self.jumpToHomepage()
        return
        
        let url = URL(string: "\(APIurl)/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = (token + "\"username\": \"\(usernameField.text!)\",  \"password\": \"\(passwordField.text!)\"}").data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = response, let data = data {
                //print(response)
                let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: String]
                let username = json["username"]!
                let email = json["email"]
                let signature = json["signature"]
                let avatar = json["avatar"]
                let background = json["background"]
                print("\(username) has successfully loged in")
                UserDefaults.standard.set(username, forKey: "USERNAME")
                UserDefaults.standard.set(email, forKey: "EMAIL")
                UserDefaults.standard.set(signature, forKey: "SIGNATURE")
                UserDefaults.standard.set(avatar, forKey: "AVATAR")
                UserDefaults.standard.set(background, forKey: "BACKGROUND")
                DispatchQueue.main.async(execute: { () -> Void in
                    self.jumpToHomepage()
                })
            } else {
                print(error!)
            }
        }
        task.resume()
    }
    
    @objc func jumpToHomepage() {
        let avc = PostTableViewController()
        self.navigationController?.pushViewController(avc, animated: false)
    }
    @objc func jumpToRegister() {
        let avc = RegisterViewController()
        self.navigationController?.pushViewController(avc, animated: true)
    }

}

extension LoginViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}
