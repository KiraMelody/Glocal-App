//
//  ResultTableViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/16.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {

    var searchController = UISearchController()
    var isUser = UserDefaults.standard.bool(forKey: "isUser")
    var isSelf = UserDefaults.standard.bool(forKey: "isSelf")
    
    let influencers = [Influencer(name: "angelababyct", country: "Turkey", industry: "apparel", number: "67699", signature: nil, price: "$600", icon: "1"), Influencer(name: "bingbing_fan", country: "Turkey", industry: "apparel", number: "38608", signature: nil, price: "$450", icon: "2"), Influencer(name: "seray", country: "Turkey", industry: "fitness", number: "14,3K", signature: nil, price: "$150", icon: "seray"), Influencer(name: "liuwenlw", country: "Turkey", industry: "shoes", number: "418245", signature: nil, price: "$750", icon: "3"), Influencer(name: "yangmimimi912", country: "Turkey", industry: "apparel", number: "58900", signature: nil, price: "$500", icon: "4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Result"
        let textAttributes = [NSAttributedString.Key.foregroundColor: ColorandFontTable.primaryGreen]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = ColorandFontTable.darkGray
        self.navigationController?.navigationBar.isTranslucent = false
        var menu = UIImage(named: "menu")
        menu = menu?.withRenderingMode(.alwaysOriginal)
        let menuButton = UIBarButtonItem(image: menu, style: .plain, target: self, action: #selector(openPanel))
        self.navigationItem.rightBarButtonItem = menuButton
        var back = UIImage(named: "back")
        back = back?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backToLast))
        self.navigationItem.leftBarButtonItem = backButton
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.backgroundColor = ColorandFontTable.groundGray
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: "ResultTableViewCell")
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
        return influencers.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as! ResultTableViewCell
        cell.selectionStyle = .none
        cell.influencer = influencers[indexPath.row]
        cell.connectButton.addTarget(self, action: #selector(jumpToProfile), for: .touchUpInside)
        return cell
    }
    @objc func backToLast() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @objc func jumpToProfile() {
        let avc = ProfileViewController()
        self.navigationController?.pushViewController(avc, animated: true)
    }
    @objc func openPanel() {
        panel?.openLeft(animated: true)
    }

}
