//
//  ProfileViewController.swift
//  Pogether
//
//  Created by apple on 2017/1/17.
//  Copyright © 2017年 Wang. All rights reserved.
//

import SDWebImage

protocol ChangeFriend: NSObjectProtocol {
    func removefriend(username: String)
    func addfriend(user: Account)
}

class ProfileViewController: UIViewController, UINavigationControllerDelegate
{
    var width, height: CGFloat!
    
    var scrollView: UIScrollView!
    var wallpaperView: UIImageView!
    var iconView: UIImageView!
    
    var usernameLabel: UILabel!
    
    var signatureView: UIView!
    var signatureLabel: UILabel!
    var signatureContentLabel: UILabel?
    
    var settingsButton: UIButton!
    var backButton: UIButton!
    
    public var user: Account!
    
    var isIcon = false
    var isSetting = false
    var isStranger = false
    
    weak var delegate: ChangeFriend?
    var indexPath: IndexPath!
    
    func initialize()
    {
        width = view.frame.width
        height = view.frame.height
//        if isSetting {
//            user = Account(username: UserDefaults.standard.value(forKey: "USERNAME") as! String)
//            user.email = UserDefaults.standard.value(forKey: "EMAIL") as! String?
//            user.signature = UserDefaults.standard.value(forKey: "SIGNATURE") as! String?
//            if (UserDefaults.standard.value(forKey: "AVATAR") != nil)
//            {
//                //user.avatar = URL(string: (UserDefaults.standard.value(forKey: "AVATAR") as! String))
//            }
//            if (UserDefaults.standard.value(forKey: "BACKGROUND") != nil)
//            {
//                //user.background = URL(string: UserDefaults.standard.value(forKey: "BACKGROUND") as! String)
//            }
//        }
        user = Account(username: "Jiaqi", email: "jessietong96@gamil.com", signature: "good", avatar: "icon", background: "LoginView_Background")
        wallpaperView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height * 0.3555))
        wallpaperView.image = UIImage(named: "wall")
        wallpaperView.contentMode = .scaleAspectFill
        wallpaperView.clipsToBounds = true
//        if user.background != nil
//        {
//            wallpaperView.sd_setImage(with: user.background, placeholderImage: #imageLiteral(resourceName: "Profile_Background"))
//        }
//        else
//        {
//            wallpaperView.image = #imageLiteral(resourceName: "Profile_Background")
//        }
        
        scrollView = UIScrollView(frame: view.frame)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 1
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: width, height: height + 1)
        
        iconView = UIImageView(frame: CGRect(x: width / 2 - height * 0.08625, y: height * 0.26925, width: height * 0.1725, height: height * 0.1725))
        iconView.contentMode = .scaleAspectFill
        iconView.image = UIImage(named: user.avatar ?? "default")
//        if user.avatar != nil
//        {
//            iconView.sd_setImage(with: user.avatar, placeholderImage: #imageLiteral(resourceName: "whatwhat_pc_icons2"))
//        }
//        else
//        {
//            iconView.image = #imageLiteral(resourceName: "icon")
//        }
        let imageLayer = iconView.layer
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = iconView.frame.size.height / 2
        
        usernameLabel = UILabel()
        usernameLabel.text = user.username
        usernameLabel.textAlignment = .center
        usernameLabel.font = .systemFont(ofSize: 20)
        
        signatureLabel = UILabel()
        signatureLabel.text = "influence and earn"
        signatureLabel.textColor = ColorandFontTable.textGray1
        signatureLabel.textAlignment = .center
        signatureLabel.font = .systemFont(ofSize: 14)
        
//        settingsButton = UIButton(type: .roundedRect)
//        settingsButton.layer.cornerRadius = 5
//        if isSetting {
//            settingsButton.setTitle("退出账号", for: .normal)
//            settingsButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
//        } else if isStranger {
//            settingsButton.setTitle("加为好友", for: .normal)
//            settingsButton.addTarget(self, action: #selector(addFriend), for: .touchUpInside)
//        } else {
//            settingsButton.setTitle("删除好友", for: .normal)
//            settingsButton.addTarget(self, action: #selector(deleteFriend), for: .touchUpInside)
//        }
//
//        settingsButton.setTitleColor(.white, for: .normal)
//        settingsButton.backgroundColor = ColorandFontTable.tintGreen
//        settingsButton.titleLabel?.font = .systemFont(ofSize: height * 0.03)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
//        view.addGestureRecognizer(tap)
        
        var back = UIImage(named: "back")
        back = back?.withRenderingMode(.alwaysOriginal)
        backButton = UIButton()
        backButton.setImage(back, for: .normal)
        backButton.addTarget(self, action: #selector(backToLast), for: .touchUpInside)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController!.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        
        initialize()
        
//        loadRecentThreePhotos()
        
        scrollView.addSubview(usernameLabel)
        scrollView.addSubview(signatureLabel)
        
//        scrollView.addSubview(settingsButton)

        view.addSubview(scrollView)
        view.addSubview(wallpaperView)
        view.addSubview(iconView)
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints{(make) in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(view).offset(50)
            make.height.equalTo(24)
        }
        
        usernameLabel.snp.makeConstraints{(make) in
            make.centerX.equalTo(scrollView)
            make.top.equalTo(scrollView).offset(height * 0.456)
            make.height.equalTo(height * 0.036)
        }
        
        signatureLabel.snp.makeConstraints{(make) in
            make.centerX.equalTo(scrollView)
            make.height.equalTo(height * 0.036)
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
        }
        
        
//        settingsButton.snp.makeConstraints{(make) in
//            make.top.equalTo(scrollView.snp.top).offset(height * 0.822)
//            make.centerX.equalTo(scrollView.snp.centerX)
//            make.width.equalTo(width * 0.9)
//            make.height.equalTo(height * 0.069)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.isHidden = true
        if signatureContentLabel != nil && user.signature != nil
        {
            signatureContentLabel!.text = user.signature
        }
    }
    
//    func loadRecentThreePhotos() {
//
//
//        let url = URL(string: "\(APIurl)/album/recent")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        request.httpBody = "{\n  \"username\": \(user.username)\n}".data(using: .utf8)
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let _ = response, let data = data {
//                let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: String]
//                let url1 = json["photo1"]!
//                let url2 = json["photo2"]!
//                let url3 = json["photo3"]!
//            } else {
//                print(error!)
//            }
//        }
//
//        task.resume()
//
//    }
    
    func imageFromURL(url: URL) -> UIImage?
    {
        let data = NSData(contentsOf: url)
        if data == nil
        {
            return nil
        }
        return UIImage(data: data! as Data)
    }
    
    @objc func tapped(sender: UITapGestureRecognizer)
    {
        let loc = sender.location(in: view)
        if isSetting
        {
            if iconView.frame.contains(loc)
            {
                changeIcon()
                return
            }
            if wallpaperView.frame.contains(loc)
            {
                changeWallpaper()
                return
            }
            if signatureView.frame.contains(loc)
            {
            }
        }
    }
    
    func changeWallpaper()
    {
        let picker = UIImagePickerController()
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        isIcon = false
        let alert = UIAlertController(title: "更换封面", message: "", preferredStyle: .actionSheet)
        let action0 = UIAlertAction(title: "从相册选择", style: .default){(handler) in
            self.navigationController!.present(picker, animated: true, completion: nil)
        }
        let action1 = UIAlertAction(title: "拍一张", style: .default){(handler) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
            {
                picker.sourceType = .camera
                self.navigationController!.present(picker, animated: true, completion: nil)
            }
            else
            {
                NSLog("不支持相机")
            }
        }
        let action2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(action0)
        alert.addAction(action1)
        alert.addAction(action2)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func changeIcon()
    {
        let picker = UIImagePickerController()
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        isIcon = true
        let alert = UIAlertController(title: "更换头像", message: "", preferredStyle: .actionSheet)
        let action0 = UIAlertAction(title: "从默认头像选择", style: .default){(handler) in
            let rand = arc4random() % 31
            self.iconView.image = UIImage(imageLiteralResourceName: "whatwhat_pc_icons\(rand)")
        }
        let action1 = UIAlertAction(title: "从手机相册选择", style: .default){(handler) in
            self.navigationController!.present(picker, animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "拍一张", style: .default){(handler) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
            {
                picker.sourceType = .camera
                self.navigationController!.present(picker, animated: true, completion: nil)
            }
            else
            {
                NSLog("不支持相机")
            }
        }
        let action3 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(action0)
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    @objc func holdingSignature(sender: UILongPressGestureRecognizer)
    {
        if sender.state == .began
        {
            signatureView.backgroundColor = ColorandFontTable.groundGray
        }
        else
        {
            signatureView.backgroundColor = ColorandFontTable.transparent
        }
    }
    
//    @objc func holdingAlbum(sender: UILongPressGestureRecognizer)
//    {
//        if sender.state == .began
//        {
//            albumView.backgroundColor = ColorandFontTable.groundGray
//        }
//        else
//        {
//            albumView.backgroundColor = ColorandFontTable.transparent
//        }
//    }
    @objc func backToLast()
    {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    func tappedAlbum()
    {
        let avc = UITableViewController()
        avc.isEditing = self.isSetting
        navigationController?.pushViewController(avc, animated: true)
    }
    
    @objc func logout()
    {
        let alert = UIAlertController(title: "注销", message: "您确定要注销帐号吗？", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action:UIAlertAction) in
            
            let url = URL(string: "\(APIurl)/signout")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let _ = response, let _ = data {
                    print("successfully loged out")
                    UserDefaults.standard.removeObject(forKey: "USERNAME")
                    UserDefaults.standard.removeObject(forKey: "EMAIL")
                    UserDefaults.standard.removeObject(forKey: "SIGNATURE")
                    UserDefaults.standard.removeObject(forKey: "AVATAR")
                    UserDefaults.standard.removeObject(forKey: "BACKGROUND")
                    let avc = LoginViewController()
                    let _ = self.navigationController?.popToRootViewController(animated: true)
                    self.navigationController?.pushViewController(avc, animated: false)
                } else {
                    print(error!)
                }
            }
            task.resume()
            })
        )
        self.present(alert, animated: true, completion: nil)
    }
    @objc func addFriend() {
        let url = URL(string: "\(APIurl)/addfriend")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = "{\n  \"username\": \(user.username)\n}".data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = response, let _ = data {
                NSLog("加好友啦！QAQ")
            } else {
                print(error!)
            }
        }
        
        task.resume()
        self.delegate?.addfriend(user: self.user)
        settingsButton.setTitle("删除好友", for: .normal)
//        settingsButton.addTarget(self, action: #selector(deleteFriend), for: UIEvent.touches())
    }
    
    @objc func deleteFriend() {
        let url = URL(string: "\(APIurl)/deletefriend")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = "{\n  \"username\": \(user.username)\n}".data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = response, let _ = data {
                //no response
                NSLog("删好友啦！QAQ")
            } else {
                print(error!)
            }
        }
        
        task.resume()
        self.delegate?.removefriend(username: self.user.username)
        backToLast()
    }
}

//MARK: scrollcontrol

extension ProfileViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView.contentOffset.y < 0
        {
            let ratio =  -scrollView.contentOffset.y / 0.3555 / height
            wallpaperView.frame = CGRect(x: -ratio * width / 2, y: 0, width: width * (1 + ratio), height: height * 0.3555 * (1 + ratio))
        }
        else
        {
            let offset = scrollView.contentOffset.y
            wallpaperView.frame = CGRect(x: 0, y: -offset, width: width, height: height * 0.3555)
        }
        iconView.frame = CGRect(x: width / 2 - height * 0.08625, y: height * 0.26925 - scrollView.contentOffset.y, width: height * 0.1725, height: height * 0.1725)
    }
}

//MARK: ImagePicker
//
//extension ProfileViewController: UIImagePickerControllerDelegate
//{
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
//    {
//        let selectImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        if isIcon
//        {
//            iconView.image = selectImage
//        }
//        else
//        {
//            wallpaperView.image = selectImage
//        }
//        picker.dismiss(animated: true, completion: nil)
//
//    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
//    {
//        picker.dismiss(animated: true, completion: nil)
//    }
//}
