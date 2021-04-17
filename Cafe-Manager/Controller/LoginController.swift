//
//  ViewController.swift
//  Cafe-Manager
//
//  Created by isuru on 4/15/21.
//  Copyright © 2021 isuru. All rights reserved.
//
import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak
    var email: UITextField!
        @IBOutlet weak
    var password: UITextField!
        let auth = Auth.auth()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onLogin(_ sender: UIButton) {
        let email: String = self.email.text!
            let password: String = self.password.text!
                let ckresult: Bool = CheckEmail.isValidEmail(email: email)
        if !ckresult {
            let alert = UIAlertController(title: "Email Error", message: "please check Email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if (password == "") {
            let alert = UIAlertController(title: "Password Error", message: "password can not be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            auth.signIn(withEmail: email, password: password) {
                authResult,
                error in

                if error != nil {

                    if let errCode = AuthErrorCode(rawValue: error!._code) {

                        switch errCode {
                            case.wrongPassword:
                                let alert = UIAlertController(title: "Authentication Error", message: " invalid Email or Password", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            case.userNotFound:
                                let alert = UIAlertController(title: "Authentication Error", message: " invalid Email or Password", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            case.invalidEmail:
                                let alert = UIAlertController(title: "Authentication Error", message: " invalid Your Email", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)

                            default:
                            print("Create User Error: \(error!)")
                        }
                    }

                } else {
                    self.performSegue(withIdentifier: "Home", sender: self)
                }
            }
        }
    }

    @IBAction func OnRegister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Register", sender: self)
    }
    @IBAction func OnFogotPwd(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ForgotPassword", sender: self)
    }
}
