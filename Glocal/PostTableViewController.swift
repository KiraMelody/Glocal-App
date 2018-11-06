//
//  PostTableViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/5.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        self.title = "New Post"
        let textAttributes = [NSAttributedString.Key.foregroundColor: ColorandFontTable.primaryGreen]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = ColorandFontTable.darkGray
        self.navigationController?.navigationBar.isTranslucent = false
        var back = UIImage(named: "back")
        back = back?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backToLast))
        self.navigationItem.leftBarButtonItem = backButton
        var envelope = UIImage(named: "envelope")
        envelope = envelope?.withRenderingMode(.alwaysOriginal)
        let messageButton = UIBarButtonItem(image: envelope, style: .plain, target: self, action: #selector(backToLast))
        self.navigationItem.rightBarButtonItem = messageButton
        
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
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
            controller.searchBar.removeFromSuperview()
//            controller.delegate = self as! UISearchControllerDelegate
            return controller
        })()
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.searchController.searchBar.frame.height + 2))
        header.backgroundColor = ColorandFontTable.darkGray
        header.addSubview(self.searchController.searchBar)
        tableView.tableHeaderView = header
        self.searchController.searchBar.isHidden = false
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.tintColor = ColorandFontTable.primaryGreen
        self.searchController.searchBar.barTintColor = UIColor.white
        self.searchController.searchBar.backgroundColor = ColorandFontTable.darkGray
        self.tableView.backgroundColor = ColorandFontTable.darkGray
        
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
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    @objc func backToLast() {
        let _ = self.navigationController?.popViewController(animated: true)
    }

}
