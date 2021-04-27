//
//  CategoryViewController.swift
//  Cafe-Manager
//
//  Created by isuru on 4/17/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import Firebase

class CategoryViewController: UIViewController {
    
    

    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtCategory: UITextField!
    var categories :[Category] = []
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate=self
//        tableView.dataSource=self
        ref = Database.database().reference()
        let allPlaces = self.ref.child("Category")

        allPlaces.observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let placeDict = snap.value as! [String: Any]
                let categoryName = placeDict["category"] as! String
                let id = placeDict["id"] as! String
                let delete=placeDict["isDelete"] as! String
               
                
                let cate = Cafe_Manager.Category(category: categoryName, id: id, isDelete: delete)
                                   
                                   self.categories.append(cate)
               
            }
                            self.tableView.reloadData()
                //            print(self.foods[0].id)
                        })
    }


   

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
