//
//  Account.swift
//  Glocal
//
//  Created by KiraMelody on 2018/10/25.
//  Copyright © 2018年 KiraMelody. All rights reserved.
//

import Foundation

public class Account {
    
    var username: String
    var email: String?
    var signature: String?
    var country: String?
    var avatar: String?
    var background: String?
    init(username: String)
    {
        self.username = username
    }
    init(username: String, country: String?,email: String?, signature: String?, avatar: String?, background: String?)
    {
        self.username = username
        self.country = country
        self.email = email
        self.signature = signature
        self.avatar = avatar
        self.background = background
    }
}
