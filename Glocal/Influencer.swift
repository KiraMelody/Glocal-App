//
//  Influencer.swift
//  Glocal
//
//  Created by KiraMelody on 2018/11/16.
//  Copyright © 2018 KiraMelody. All rights reserved.
//

import Foundation
import UIKit

public class Influencer {
    
    var name: String
    var email: String?
    var number: String?
    var industry: String?
    var signature: String?
    var country: String?
    var icon: UIImage?
    var price: String?
    var background: UIImage?
    
    init(name: String)
    {
        self.name = name
    }
    init(name: String, country: String?, industry: String?, number: String?, signature: String?, price:String?, icon: String)
    {
        self.name = name
        self.country = country
        self.number = number
        self.industry = industry
        self.signature = signature
        self.price = price
        self.icon = UIImage(named: icon)
    }
}
