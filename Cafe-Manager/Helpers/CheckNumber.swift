//
//  CheckNumber.swift
//  Cafe-Manager
//
//  Created by isuru on 4/17/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import Foundation
class CheckNumber{
    static func checkNumber(number:String)->Bool{
        let num = Int(number)
        if num != nil {
         return true
        }
        else {
         return false
        }
        
    }
}
