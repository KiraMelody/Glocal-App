//
//  MenuTableViewCell.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/14.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    var infoLabel: UILabel!
    var iconView: UIImageView!
    
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
        infoLabel.numberOfLines = 0
        infoLabel.font = UIFont(name: "Helvetica", size: 14)
        
        iconView = UIImageView()
        
        contentView.addSubview(iconView)
        contentView.addSubview(infoLabel)
        
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
        infoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(5)
            make.right.equalTo(contentView).offset(-10)
            make.centerY.equalTo(contentView)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
