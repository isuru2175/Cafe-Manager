//
//  Item.swift
//  Cafe-Manager
//
//  Created by isuru on 4/28/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import Foundation
class Item {
   var foodName : String
     var discription : String
     var price : Float
    var category:String
     var discount : Float
     var id : String
     var photoURL:String
    var sell:Int
    
     
    init(Name : String,discription : String,price : Float,discount:Float,id:String,photourl:String,sell:Int,category:String) {
         
         self.foodName = Name
         self.discription = discription
         self.price = price
        self.category=category
         self.discount = discount
         self.id = id
         self.photoURL=photourl
        self.sell=sell
         
         
     }
}
