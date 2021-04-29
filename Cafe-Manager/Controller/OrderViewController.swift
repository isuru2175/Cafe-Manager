//
//  OrderViewController.swift
//  Cafe-Manager
//
//  Created by isuru on 4/28/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var ref: DatabaseReference!
    var order:[Order]=[]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
               let allPlaces = self.ref.child("CustomerOrders")
                       allPlaces.observe(.value, with: { snapshot in
                           for child in snapshot.children {
                               let snap = child as! DataSnapshot
                               let placeDict = snap.value as! [String: Any]
                               let CustomerName = placeDict["customerName"] as! String
                               let orderId = placeDict["orderId"] as! Int
                               let totalBill = placeDict["totalBill"] as! Float
                            let orderStatus = placeDict["orderStatus"] as! Int
                               
                               let orders = Cafe_Manager.Order(Name: CustomerName, OrderId: orderId, Total: totalBill, OrderStatus: orderStatus)
                                                  
                                                  self.order.append(orders)
                              
                              
                           }
                           self.tableView.reloadData()
               //            print(self.foods[0].id)
                       })

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.order.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! orderTableViewCell
                    

        cell.CustomerName.text = self.order[indexPath.row].CustomerName
        cell.OrderId.text=String(self.order[indexPath.row].OrderId)
            return cell
                    
                        
        //                self.foods[indexPath.row].id
                    }
//                      let storage = Storage.storage()
//                      let storageRef = storage.reference()
        //            storageRef.child("").get
        //              let path = self.foods[indexPath.row].photoURL
        //
        //
        //              let formattedString = path.replacingOccurrences(of: " ", with: "")
        //              let islandRef = storageRef.child(formattedString)
        //
        //              islandRef.getData(maxSize: 1 * 250 * 250) { data, error in
        //                  if error != nil {
        //                 print("error")
        //                } else {
        //                  // Data for "images/island.jpg" is returned
        //                  let image = UIImage(data: data!)
        //                  cell.FoodItemImage.image = image
        //
        //
        //                }
        //              }
            //        cell.FoodItemImage.image = UIImage(named: foodItems[2])


                   
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


