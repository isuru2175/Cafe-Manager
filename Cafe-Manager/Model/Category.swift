//
//  Category.swift
//  Cafe-Manager
//
//  Created by isuru on 4/18/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import Foundation
class Category {
    var category : String
    var id : String
    var isDelete : String
    
   
    
    init(category : String,id : String,isDelete : String) {
        
        self.category = category
        self.id = id
        self.isDelete = isDelete        
        
    }
}


