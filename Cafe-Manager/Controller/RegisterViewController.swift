//
//  RegisterViewController.swift
//  Cafe-Manager
//
//  Created by isuru on 4/17/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class RegisterViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    let auth = Auth.auth()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    
    @IBAction func onChangePhoneNo(_ sender: Any) {
        if !CheckNumber.checkNumber(number: self.phoneNumber.text!) &&  self.phoneNumber.text?.count != 0
        
        {
            let  alert = UIAlertController(title: "Phone Number Error", message: "Please Enter Valid Phone Number", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
                var str = self.phoneNumber.text!
                str.remove(at: str.index(before: str.endIndex))
                 self.phoneNumber.text=str
            }
        
    }
    @IBAction func onRegister(_ sender: UIButton) {
                let email : String = self.email.text!
                let password : String = self.password.text!
        let cPassword:String=self.confirmPassword.text!
                let phoneNo=phoneNumber.text;
        let ckresult:Bool = CheckEmail.isValidEmail(email:email)
                     if !ckresult
                     {
                         let  alert = UIAlertController(title: "Email Error", message: "please check Email", preferredStyle: .alert)
                          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                         self.present(alert, animated: true, completion: nil)
                     }
                     else if (self.phoneNumber.text!.count < 9)
                     {
                        let  alert = UIAlertController(title: "Phone Number Error", message: "Phone Number must be of minimum 09 characters", preferredStyle: .alert)
                         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                     }
                     else if ( password == "")
                     {
                         let  alert = UIAlertController(title: "Password Error", message: "password can not be empty", preferredStyle: .alert)
                          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                         self.present(alert, animated: true, completion: nil)
                     }
                        else if(password.count < 8)
                     {
                        let  alert = UIAlertController(title: "Password Error", message: "password must be of minimum 8 characters", preferredStyle: .alert)
                                                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                                self.present(alert, animated: true, completion: nil)
                     }
                        else if(cPassword != password)
                     {
                        let  alert = UIAlertController(title: "Password Error", message: "Your password and confirmation password do not match", preferredStyle: .alert)
                         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                     }
                else{
                
                auth.createUser(withEmail: email, password: password) { authResult, error in
                    if error != nil {

                        if let errCode = AuthErrorCode(rawValue: error!._code) {

                            switch errCode {
                            case .emailAlreadyInUse:
                                let  alert = UIAlertController(title: "Authentication Error", message: email + " is already used", preferredStyle: .alert)
                                                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                                       self.present(alert, animated: true, completion: nil)
                                    
                                case .invalidEmail:
                                    let  alert = UIAlertController(title: "Authentication Error", message: email + " is invalid", preferredStyle: .alert)
                                                                                           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                                                                          self.present(alert, animated: true, completion: nil)
                                default:
                                    print("Create User Error: \(error!)")
                            }
                        }

                    }
                    else
                    {
                        
                         let ref = Database.database().reference()
                        let userid=authResult!.user.uid
                        ref.child("users/"+userid).setValue(["uid":userid,
                                                     "phoneNo":phoneNo,"email":email])

                        
                        self.performSegue(withIdentifier: "Home", sender: self)
                    }
                  
                    }
        }
                
    }
    @IBAction func onLogin(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Login", sender: self)
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
