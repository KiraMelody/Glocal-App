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
    var requirementLabel: UILabel!
    
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
        
        priceLabel = UILabel()
        priceLabel.text = "$100 / post"
        priceLabel.font = UIFont.systemFont(ofSize: 15)
        priceLabel.textColor = ColorandFontTable.primaryGreen
        
        requirementLabel = UILabel()
        requirementLabel.text = "80 / 100"
        requirementLabel.font = UIFont.systemFont(ofSize: 10)
        
        contentView.addSubview(portraitView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(industryLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(requirementLabel)
        
        portraitView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(10)
            make.width.equalTo(36)
            make.height.equalTo(36)
            make.centerY.equalTo(contentView)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(portraitView.snp.right).offset(10)
            make.top.equalTo(contentView).offset(10)
        }
        industryLabel.snp.makeConstraints { (make) in
            make.left.equalTo(portraitView.snp.right).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        countryLabel.snp.makeConstraints { (make) in
            make.left.equalTo(industryLabel.snp.right).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(portraitView.snp.right).offset(10)
            make.top.equalTo(industryLabel.snp.bottom).offset(5)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(portraitView.snp.right).offset(10)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
        }
        requirementLabel.snp.makeConstraints { (make) in
            make.right.equalTo(contentView).offset(-30)
            make.bottom.equalTo(priceLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
