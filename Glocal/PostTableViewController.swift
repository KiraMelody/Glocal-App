//
//  PostTableViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/5.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit
import FAPanels

class PostTableViewController: UITableViewController {

    var parentNavigationController: UINavigationController?
    var searchController = UISearchController()
    var isUser: Bool!
    var isSelf: Bool!
    
    let posts = [Post(name: "Gymtime", description: "Intro: GymTime is a China based company sells fitness products, we want to extand our market globally.", industry: "Fitness", price: "$150", country: "China", message: "", icon: "gym"), Post(name: "Converse", description: "Converse is an American shoe company that primarily produces skating shoes and lifestyle brand footwear and apparel. Founded in 1908, it has been a subsidiary of Nike, Inc. since 2003", industry: "Fashion | Shoes", price: "400", country: "Japan", message: "",icon: "converse"), Post(name: "Sephora", description: "Sephora is a Paris, France-based multinational chain of personal care and beauty stores founded in Paris in 1969.Featuring nearly 300 brands", industry: "Beauty", price: "800", country: "UK", message: "",icon: "sephora")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isUser = UserDefaults.standard.bool(forKey: "isUser")
        isSelf = UserDefaults.standard.bool(forKey: "isSelf")
        
//        self.title = "New Post"
//        let textAttributes = [NSAttributedString.Key.foregroundColor: ColorandFontTable.primaryGreen]
//        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationController?.navigationBar.barTintColor = ColorandFontTable.darkGray
//        self.navigationController?.navigationBar.isTranslucent = false
//        var menu = UIImage(named: "menu")
//        menu = menu?.withRenderingMode(.alwaysOriginal)
//        let menuButton = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(openPanel))
//        self.navigationItem.leftBarButtonItem = menuButton
//        var envelope = UIImage(named: "envelope")
//        envelope = envelope?.withRenderingMode(.alwaysOriginal)
//        let messageButton = UIBarButtonItem(image: envelope, style: .plain, target: self, action: #selector(backToLast))
//        self.navigationItem.rightBarButtonItem = messageButton
//        self.definesPresentationContext = true
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.backgroundColor = ColorandFontTable.groundGray
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.sectionIndexColor = ColorandFontTable.primaryGreen
//        tableView.sectionIndexBackgroundColor = UIColor.clear
        tableView.tableFooterView = UIView(frame: .zero)

        self.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
//            controller.searchResultsUpdater = self as! UISearchResultsUpdating
            controller.hidesNavigationBarDuringPresentation = true
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
//            controller.searchBar.removeFromSuperview()
//            controller.delegate = self as! UISearchControllerDelegate
            return controller
        })()
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.searchController.searchBar.frame.height + 2))
        header.backgroundColor = ColorandFontTable.groundGray
        header.addSubview(self.searchController.searchBar)
        tableView.tableHeaderView = header
        self.searchController.searchBar.isHidden = false
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.tintColor = ColorandFontTable.primaryGreen
        self.searchController.searchBar.barTintColor = UIColor.white
        self.searchController.searchBar.backgroundColor = ColorandFontTable.groundGray
        self.tableView.backgroundColor = ColorandFontTable.groundGray
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.searchController.searchBar.isHidden = false
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.selectionStyle = .none
        cell.post = posts[indexPath.row]
        cell.connectButton.addTarget(self, action: #selector(jumpToProfile), for: .touchUpInside)
        return cell
    }
    @objc func backToLast() {
        let _ = parentNavigationController?.popViewController(animated: true)
    }
    
    @objc func jumpToProfile() {
        UserDefaults.standard.set(false, forKey: "isUser")
        UserDefaults.standard.set(false, forKey: "isSelf")
        let avc = ProfileViewController()
        parentNavigationController?.pushViewController(avc, animated: true)
    }
    @objc func openPanel() {
        panel?.openLeft(animated: true)
    }

}
