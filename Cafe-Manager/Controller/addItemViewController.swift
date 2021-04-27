//
//  addItemViewController.swift
//  Cafe-Manager
//
//  Created by isuru on 4/27/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import Firebase
class CellClass: UITableViewCell {
    
}
class addItemViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var categoryList: UIButton!
    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    var dataSource :[Category] = []
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "categoryCell")
        ref = Database.database().reference()
        
        let allPlaces = self.ref.child("Category").queryOrdered(byChild: "isDelete").queryEqual(toValue: "0")
        allPlaces.observe(.value, with: { snapshot in
        for child in snapshot.children {
            let snap = child as! DataSnapshot
            let placeDict = snap.value as! [String: Any]
            let categoryName = placeDict["category"] as! String
            let id = placeDict["id"] as! String
            let delete=placeDict["isDelete"] as! String
           
            
            let cate = Cafe_Manager.Category(category: categoryName, id: id, isDelete: delete)
                                          
                                          self.dataSource.append(cate)
                      
                   }
//                                   self.categoryTable.reloadData()
                       //            print(self.foods[0].id)
                               })
        // Do any additional setup after loading the view.
    }
    @IBAction func onCheck(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        }
        else
        {
            sender.isSelected = true
        }
    }
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        self.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
       let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: 200)
        }, completion: nil)
    }
    @objc func removeTransparentView() {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }

    @IBAction func onSelectCategory(_ sender: Any) {
//        dataSource = ["Apple", "Mango", "Orange"]
        selectedButton = categoryList
        addTransparentView(frames: categoryList.frame)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.dataSource.count
       }
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell",for: indexPath)
        cell.textLabel?.text = self.dataSource[indexPath.row].category
        //              let storage = Storage.storage()
        //              let storageRef = storage.reference()
                      
        //              let path = self.categories[indexPath.row].photoURL
                      
                     
            //        cell.FoodItemImage.image = UIImage(named: foodItems[2])

        //            cell.lblFoofDescription.text = self.foods[indexPath.row].discription
        //            cell.lblPrice.text = ( "Rs." + String(self.foods[indexPath.row].price))

                    return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row].category, for: .normal)
        removeTransparentView()
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
//extension ViewController:UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataSource.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
//    }
//
//
//}
