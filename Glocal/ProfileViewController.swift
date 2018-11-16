//
//  ProfileViewController.swift
//  GLocal
//
//  Created by apple on 2018/11/1.
//  Copyright © 2018年 KiraMelody. All rights reserved.
//

import SnapKit
import PageMenu
import FAPanels

class ProfileViewController: UIViewController, UINavigationControllerDelegate
{
    var width, height: CGFloat!
    
    var scrollView: UIScrollView!
    var wallpaperView: UIImageView!
    var iconView: UIImageView!
    var usernameLabel: UILabel!
    var countryLabel: UILabel!
    var followerLabel: UILabel!
    var dealLabel: UILabel!
    var signatureLabel: UILabel!
    var settingsButton: UIButton!
    var menuButton: UIButton!
    var upButton: UIButton!
    var connectButton: UIButton!
    var pageMenu: CAPSPageMenu!
    var noticeView: UIImageView!
    
    public var user: Account!
    
    var isSelf: Bool!
    var isUser: Bool!
    
    var indexPath: IndexPath!
    
    func initialize()
    {
        isSelf = UserDefaults.standard.bool(forKey: "isSelf")
        isUser = UserDefaults.standard.bool(forKey: "isUser")
        print("profile: ", isUser, isSelf )
        width = view.frame.width
        height = view.frame.height
        if isUser {
            user = Account(username: "Seray", country: "Turkey", email: "jessietong96@gamil.com", signature: "good", avatar: "seray", background: "")
        } else {
            user = Account(username: "Gymtime", country: "China", email: "gymtime@gamil.com", signature: "good", avatar: "gym", background: "")
        }
        
        wallpaperView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height * 0.4))
        wallpaperView.image = UIImage(named: "wall")
        wallpaperView.contentMode = .scaleAspectFill
        wallpaperView.clipsToBounds = true
        
        scrollView = UIScrollView(frame: view.frame)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 1
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: width, height: height * 1.5)
        
        iconView = UIImageView(frame: CGRect(x: width / 2 - 50, y: height * 0.15 - 50, width: 100, height: 100))
        iconView.contentMode = .scaleAspectFill
        iconView.image = UIImage(named: user.avatar ?? "default")

        let imageLayer = iconView.layer
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = iconView.frame.size.height / 2
        
        usernameLabel = UILabel()
        usernameLabel.text = user.username
        usernameLabel.textAlignment = .center
        usernameLabel.font = .systemFont(ofSize: 24)
        
        countryLabel = UILabel()
        countryLabel.text = user.country
        countryLabel.textAlignment = .center
        countryLabel.font = .systemFont(ofSize: 20)
        
        followerLabel = UILabel()
        followerLabel.text = "Follower 14,3k"
        followerLabel.textColor = ColorandFontTable.textGray1
        followerLabel.textAlignment = .center
        followerLabel.font = .systemFont(ofSize: 16)
        
        dealLabel = UILabel()
        dealLabel.text = "Deals 10"
        dealLabel.textColor = ColorandFontTable.textGray1
        dealLabel.textAlignment = .center
        dealLabel.font = .systemFont(ofSize: 16)
        
        signatureLabel = UILabel()
        if isUser {
            signatureLabel.text = "Intro: I am interested in trying international brands and becoming a trendsetter."
        } else {
            signatureLabel.text = "Intro: GymTime is a China based company sells fitness products, we want to extand our market globally."
        }
        signatureLabel.textColor = ColorandFontTable.textGray1
        signatureLabel.textAlignment = .center
        signatureLabel.font = .systemFont(ofSize: 14)
        signatureLabel.numberOfLines = 0
        
        connectButton = UIButton(type: .roundedRect)
        connectButton.setTitleColor(UIColor.white, for: .normal)
        connectButton.backgroundColor = ColorandFontTable.primaryGreen
        connectButton.setTitle("Connect", for: .normal)
        connectButton.layer.masksToBounds = true
        connectButton.layer.cornerRadius = 5
        connectButton.addTarget(self, action: #selector(jumpToConnect), for: .touchUpInside)
        
        noticeView = UIImageView()
        noticeView.image = UIImage(named: "notice")
        noticeView.contentMode = .scaleToFill
        noticeView.isHidden = true
        
        if isSelf {
            var menu = UIImage(named: "menu")
            menu = menu?.withRenderingMode(.alwaysOriginal)
            menuButton = UIButton()
            menuButton.setImage(menu, for: .normal)
            menuButton.addTarget(self, action: #selector(openPanel), for: .touchUpInside)
        } else {
            var menu = UIImage(named: "back")
            menu = menu?.withRenderingMode(.alwaysOriginal)
            menuButton = UIButton()
            menuButton.setImage(menu, for: .normal)
            menuButton.addTarget(self, action: #selector(backToLast), for: .touchUpInside)
        }
        var up = UIImage(named: "up")
        up = up?.withRenderingMode(.alwaysOriginal)
        upButton = UIButton()
        upButton.setImage(up, for: .normal)
        upButton.addTarget(self, action: #selector(upMenu), for: .touchUpInside)
        
        var controllerArray : [UIViewController] = []
        let infoTable = InfoTableViewController()
        infoTable.title = "Profile"
//        infoTable = self.navigationController
        controllerArray.append(infoTable)
        let postTable = PostTableViewController()
        postTable.title = "Posts"
        postTable.parentNavigationController = self.navigationController
        if isUser && isSelf {
            controllerArray.append(postTable)
            noticeView.isHidden = false
        }
        let messageTable = MessageTableViewController()
        messageTable.title = "Messages"
        messageTable.parentNavigationController = self.navigationController
        if isSelf {
            controllerArray.append(messageTable)
        }
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor.white),
            .bottomMenuHairlineColor(ColorandFontTable.groundGray),
            .selectionIndicatorColor(ColorandFontTable.primaryGreen),
            .menuMargin(20.0),
            .menuHeight(40.0),
            .selectedMenuItemLabelColor(UIColor.black),
            .unselectedMenuItemLabelColor(ColorandFontTable.darkGray),
            .menuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorRoundEdges(true),
            .selectionIndicatorHeight(2.0),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: 0, width: width, height: height * 0.6), pageMenuOptions: parameters)
        pageMenu.delegate = self
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true

        initialize()

//        scrollView.addSubview(settingsButton)
        view.addSubview(scrollView)
        view.addSubview(wallpaperView)
        view.addSubview(iconView)
        view.addSubview(usernameLabel)
        view.addSubview(countryLabel)
        view.addSubview(signatureLabel)
        view.addSubview(followerLabel)
        view.addSubview(dealLabel)
        view.addSubview(pageMenu.view)
        view.addSubview(connectButton)
        view.addSubview(menuButton)
        view.addSubview(upButton)
        view.addSubview(noticeView)
        
        menuButton.snp.makeConstraints{(make) in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(view).offset(50)
            make.height.equalTo(24)
        }
        upButton.snp.makeConstraints{(make) in
            make.right.equalTo(view).offset(-20)
            make.top.equalTo(view).offset(50)
            make.height.equalTo(24)
        }
        usernameLabel.snp.makeConstraints{(make) in
            make.centerX.equalTo(scrollView)
            make.top.equalTo(iconView.snp.bottom).offset(15)
//            make.height.equalTo(20)
        }
        countryLabel.snp.makeConstraints{(make) in
            make.centerX.equalTo(scrollView)
            make.top.equalTo(usernameLabel.snp.bottom).offset(10)
//            make.height.equalTo(20)
        }
        followerLabel.snp.makeConstraints{(make) in
            make.centerX.equalTo(self.view).offset(-40)
            make.top.equalTo(countryLabel.snp.bottom).offset(5)
//            make.height.equalTo(20)
        }
        dealLabel.snp.makeConstraints{(make) in
            make.left.equalTo(followerLabel.snp.right).offset(10)
            make.top.equalTo(countryLabel.snp.bottom).offset(5)
//            make.height.equalTo(20)
        }
        signatureLabel.snp.makeConstraints{(make) in
            make.centerX.equalTo(scrollView)
            make.width.equalTo(scrollView).multipliedBy(0.8)
//            make.top.equalTo(followerLabel.snp.bottom)
            make.bottom.equalTo(wallpaperView).offset(-10)
        }
        connectButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollView)
            make.bottom.equalTo(scrollView).offset(-30)
            make.height.equalTo(30)
            make.width.equalTo(scrollView).multipliedBy(0.5)
        }
        pageMenu.view.snp.makeConstraints { (make) in
            make.left.equalTo(scrollView)
            make.right.equalTo(scrollView)
            make.top.equalTo(wallpaperView.snp.bottom)
            make.bottom.equalTo(scrollView)
        }
        noticeView.snp.makeConstraints { (make) in
            make.right.equalTo(view).offset(-7)
            make.top.equalTo(view).offset(380)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
        
        if isUser {
            followerLabel.isHidden = false
            dealLabel.isHidden = false
        } else {
            followerLabel.isHidden = true
            dealLabel.isHidden = true
        }
        if isSelf {
            connectButton.isHidden = true
        } else {
            connectButton.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func imageFromURL(url: URL) -> UIImage?
    {
        let data = NSData(contentsOf: url)
        if data == nil
        {
            return nil
        }
        return UIImage(data: data! as Data)
    }
    
    @objc func backToLast()
    {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    @objc func jumpToConnect()
    {
        var avc: UIViewController!
        if isUser {
            avc = ConnectViewController()
        } else {
            avc = ChatViewController()
        }
        self.navigationController?.pushViewController(avc, animated: true)
        
    }
    @objc func openPanel() {
        panel?.openLeft(animated: true)
    }
    @objc func upMenu() {
        self.scrollView.contentOffset.y = height * 0.35
    }
//    @objc func logout()
//    {
//        let alert = UIAlertController(title: "注销", message: "您确定要注销帐号吗？", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action:UIAlertAction) in
//
//            let url = URL(string: "\(APIurl)/signout")!
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                if let _ = response, let _ = data {
//                    print("successfully loged out")
//                    UserDefaults.standard.removeObject(forKey: "USERNAME")
//                    UserDefaults.standard.removeObject(forKey: "EMAIL")
//                    UserDefaults.standard.removeObject(forKey: "SIGNATURE")
//                    UserDefaults.standard.removeObject(forKey: "AVATAR")
//                    UserDefaults.standard.removeObject(forKey: "BACKGROUND")
//                    let avc = LoginViewController()
//                    let _ = self.navigationController?.popToRootViewController(animated: true)
//                    self.navigationController?.pushViewController(avc, animated: false)
//                } else {
//                    print(error!)
//                }
//            }
//            task.resume()
//            })
//        )
//        self.present(alert, animated: true, completion: nil)
    }

extension ProfileViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView.contentOffset.y < 0
        {
            let ratio =  -scrollView.contentOffset.y / 0.4 / height
            wallpaperView.frame = CGRect(x: -ratio * width / 2, y: 0, width: width * (1 + ratio), height: height * 0.4 * (1 + ratio))
        } else if scrollView.contentOffset.y < height * 0.4
        {
            let offset = scrollView.contentOffset.y
            wallpaperView.frame = CGRect(x: 0, y: -offset, width: width, height: height * 0.4)
        } else
        {
            scrollView.contentOffset.y = height * 0.4
        }
        iconView.frame = CGRect(x: width / 2 - 50, y: height * 0.15 - 50 - scrollView.contentOffset.y, width: 100, height: 100)
    }
}
