//
//  PostTableViewCell.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/5.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var portraitView: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    var industryLabel: UILabel!
    var priceLabel: UILabel!
    var countryLabel: UILabel!
    var connectButton: UIButton!
    
    var post: Post? {
        didSet {
            portraitView.image = post?.icon
            nameLabel.text = post?.name
            descriptionLabel.text = post?.description
            industryLabel.text = post?.industry
            priceLabel.text = post?.price
            countryLabel.text = post?.country
        }
    }
    
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
        
        portraitView = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        portraitView.contentMode = .scaleToFill
        portraitView.image = UIImage(named: "google")
        portraitView.layer.masksToBounds = true
        portraitView.layer.cornerRadius = portraitView.frame.size.height / 2
        
        nameLabel = UILabel()
        nameLabel.text = "FakeCompany"
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        
        industryLabel  = UILabel()
        industryLabel.text = "Fashion | Shoe"
        industryLabel.font = UIFont.systemFont(ofSize: 14)
        industryLabel.textColor = ColorandFontTable.textGray0
        
        countryLabel = UILabel()
        countryLabel.text = "U.S.A"
        countryLabel.font = UIFont.systemFont(ofSize: 14)
        countryLabel.textColor = ColorandFontTable.textGray0
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "FakeCompany is a leading shoe brand in China."
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.numberOfLines = 0
        
        priceLabel = UILabel()
        priceLabel.text = "$100 / post"
        priceLabel.font = UIFont.systemFont(ofSize: 15)
        priceLabel.textColor = ColorandFontTable.primaryGreen
        
        connectButton = UIButton(type: .roundedRect)
        connectButton.setTitleColor(UIColor.white, for: .normal)
        connectButton.backgroundColor = ColorandFontTable.primaryGreen
        connectButton.setTitle("Connect", for: .normal)
        connectButton.layer.masksToBounds = true
        connectButton.layer.cornerRadius = 5
        
        contentView.addSubview(portraitView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(industryLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(connectButton)
        
        portraitView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(10)
            make.width.equalTo(64)
            make.height.equalTo(64)
            make.centerY.equalTo(contentView)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(portraitView.snp.right).offset(15)
            make.top.equalTo(contentView).offset(10)
        }
        industryLabel.snp.makeConstraints { (make) in
            make.left.equalTo(portraitView.snp.right).offset(15)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        countryLabel.snp.makeConstraints { (make) in
            make.left.equalTo(industryLabel.snp.right).offset(15)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(portraitView.snp.right).offset(15)
            make.top.equalTo(industryLabel.snp.bottom).offset(5)
            make.right.equalTo(contentView).offset(-15)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(portraitView.snp.right).offset(15)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.bottom.equalTo(contentView).offset(-10)
        }
        connectButton.snp.makeConstraints { (make) in
            make.right.equalTo(contentView).offset(-15)
            make.bottom.equalTo(priceLabel)
            make.height.equalTo(20)
            make.width.equalTo(contentView).multipliedBy(0.3)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
