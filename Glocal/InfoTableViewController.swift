//
//  InfoTableViewController.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/14.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {

    var isUser = UserDefaults.standard.bool(forKey: "isUser")
    var info: [String?]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        info = isUser ? ["Name: Seray", "Country: Turkey", "Industry: Fitness", "Numbers of followers: 14,3K","Intro: I am interested in trying international brands and becoming a trendsetter."] : ["Name: GymTime", "Country: China", "Industry: Fitness", "Intro: GymTime is a China based company sells fitness products, we want to extand our market globally."]
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.backgroundColor = ColorandFontTable.groundGray
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "InfoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = UIView(frame: .zero)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionHeaderHeight = 0
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        cell.infoLabel.text = info[indexPath.row]
        return cell
    }

}
