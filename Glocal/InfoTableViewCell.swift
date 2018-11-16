//
//  InfoTableViewCell.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/14.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        infoLabel = UILabel()
        infoLabel.text = "FakeCompany"
        infoLabel.textColor = UIColor.black
        infoLabel.font = UIFont.systemFont(ofSize: 16)
        infoLabel.numberOfLines = 0
//        infoLabel.sizeToFit()
        
        contentView.addSubview(infoLabel)
        
        infoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView).offset(-15)
            make.centerY.equalTo(contentView)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
