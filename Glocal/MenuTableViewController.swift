//
//  MenuTableViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/14.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit
import FAPanels

class MenuTableViewController: UITableViewController {

    var parentNavigationController: UINavigationController?
    let info = ["Start Searching", "Settings", "Messages", "Recommendation", "Contact Us", "Logout"]
    let icon = [UIImage(named: "search"), UIImage(named: "settings"), UIImage(named: "settings"), UIImage(named: "settings"), UIImage(named: "settings"), UIImage(named: "settings")]
    var iconView: UIImageView!
    
    var isUser: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isUser = UserDefaults.standard.bool(forKey: "Login")
        print("menu ", isUser)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.backgroundColor = ColorandFontTable.groundGray
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionHeaderHeight = 0
        tableView.contentInsetAdjustmentBehavior = .never
        
        iconView = UIImageView(frame: CGRect(x: 75, y: 100, width: 50, height: 50))
        iconView.contentMode = .scaleAspectFill
        if isUser {
            iconView.image = UIImage(named: "seray")
        } else {
            iconView.image = UIImage(named: "gym")
        }
        iconView.isUserInteractionEnabled = true
        let tapped = UITapGestureRecognizer(target: self, action: #selector(jumpToHomepage))
        iconView.addGestureRecognizer(tapped)
        
        
        let imageLayer = iconView.layer
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = iconView.frame.size.height / 2
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        headerView.addSubview(iconView)
        headerView.backgroundColor = ColorandFontTable.darkGray
        tableView.tableHeaderView = headerView
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return info.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.infoLabel.text = info[indexPath.row]
        cell.iconView.image = icon[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            let centerVC = SearchViewController()
            var controllers = parentNavigationController?.viewControllers
            controllers!.append(centerVC)
            parentNavigationController?.setViewControllers(controllers!, animated: false)
            _ = panel?.center(parentNavigationController!)
//            parentNavigationController?.pushViewController(centerVC, animated: true)
        case 1:
            let centerVC = SearchViewController()
            parentNavigationController?.pushViewController(centerVC, animated: true)
        case 2:
            let centerVC = SearchViewController()
            parentNavigationController?.pushViewController(centerVC, animated: true)
        default:
            break
        }
    }
//    func navigateVCWith(identifier: String) {
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let centerVC: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: identifier)
//        let centerNavVC: UINavigationController? = mainStoryboard.instantiateViewController(withIdentifier: "navigation") as? UINavigationController
//        centerNavVC?.viewControllers = [centerVC]
//        panel!.configs.bounceOnCenterPanelChange = false
//        panel!.center(centerNavVC!, afterThat: {
//        })
//    }
    
    @objc func jumpToHomepage() {
        UserDefaults.standard.set(true, forKey: "isSelf")
        let avc = ProfileViewController()
        self.navigationController?.pushViewController(avc, animated: true)
    }

}
