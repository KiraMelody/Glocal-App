//
//  Post.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/16.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import Foundation
import UIKit

public class Post
{
    var name: String
    var description: String
    var industry: String
    var price: String
    var country: String
    var message: String?
    var icon: UIImage?
    
    init(name: String, description: String, industry: String, price: String, country: String, message: String?, icon: String) {
        self.name = name
        self.description = description
        self.industry = industry
        self.price = price
        self.country = country
        self.message = message
        self.icon = UIImage(named: icon)
    }
}
