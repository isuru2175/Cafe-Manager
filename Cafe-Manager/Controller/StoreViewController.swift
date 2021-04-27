//
//  StoreViewController.swift
//  Cafe-Manager
//
//  Created by isuru on 4/17/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet var viewContainer: UIView!
    var simpleView1:UIView!
    var simpleView2:UIView!
    var simpleView3:UIView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secoundView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        simpleView1 = PreviewViewController().view
//        simpleView2 = CategoryViewController().view
//        simpleView3 = MenuViewController().view
//        mainView.self.addSubview(simpleView3)
//        mainView.self.addSubview(simpleView2)
//        mainView.self.addSubview(simpleView1)
       firstView.alpha=1
//        simpleView2 = CategoryViewController().view
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        
            case 1:
                      firstView.alpha=0
                       secoundView.alpha=1
                       thirdView.alpha=0
            break
            case 2:
                      firstView.alpha=1
                       secoundView.alpha=0
                       thirdView.alpha=0
            break
            case 0:
            firstView.alpha=0
            secoundView.alpha=0
            thirdView.alpha=1
            break
        default:
            break
        }
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
