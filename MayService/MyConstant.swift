//
//  MyConstant.swift
//  MayService
//
//  Created by TST-APP-01 on 25/1/2562 BE.
//  Copyright © 2562 Teerawut. All rights reserved.
//

import Foundation

class MyConstant {
    
    func findURLaddUser(name: String, user: String, pass: String) -> String{
        let result = "https://www.androidthai.in.th/hit/addUserMay.php?isAdd=true&Name=\(name)&User=\(user)&Password=\(pass)"
        return result
    }
    
}   //My Constant Class
