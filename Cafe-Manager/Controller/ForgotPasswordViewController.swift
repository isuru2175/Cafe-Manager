//
//  ForgotPasswordViewController.swift
//  Cafe-Manager
//
//  Created by isuru on 4/17/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import FirebaseAuth
class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onForgotPassword(_ sender: UIButton) {
         let emailText=email.text!;
let ckresult:Bool = CheckEmail.isValidEmail(email:emailText)
        if !ckresult
                            {
                                let  alert = UIAlertController(title: "Email Error", message: "please type valid Email Address", preferredStyle: .alert)
                                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }
        else{
               Auth.auth().sendPasswordReset(withEmail: emailText) { error in
                 self.performSegue(withIdentifier: "Login1", sender: self)
                    let  alert = UIAlertController(title: "Reset link has been Sent", message: "If you can not find your reset link  in your  inbox, it is worth checking in your spam or junk mail section.", preferredStyle: .alert)
                                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                           self.present(alert, animated: true, completion: nil)
               
               }
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
