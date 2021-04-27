//
//  CategoryView.swift
//  Cafe-Manager
//
//  Created by isuru on 4/18/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import Firebase

class CategoryView: UIView {

    @IBOutlet weak var categoryName: UITextField!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBAction func OnAddCategory(_ sender: UIButton) {
//        let date=NSDate()
        let ref = Database.database().reference()
        let key = ref.child("Category").childByAutoId().key!
       let category=categoryName.text!
                              ref.child("Category/"+key).setValue(["id":key,
                                                                   "category":category,"isDelete":"0"])
    }
    
}
