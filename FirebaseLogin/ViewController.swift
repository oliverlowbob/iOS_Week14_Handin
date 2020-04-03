//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by admin on 03/04/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    var auth = Auth.auth()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        if let email = emailField.text, let pw = passwordField.text{
            if email.count > 5 && pw.count>5{
                signUp(email: email, pw: pw)
            }
        }
    }
    

    func signIn(email:String, pw:String){
        auth.signIn(withEmail: email, password: pw) { (result, error) in
            if error == nil{
                print("logged in")
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "loggedinvc") as! LoggedInViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            else{
                print("failed to login")
            }


        }
    }

        func signUp(email: String, pw:String){
            auth.createUser(withEmail: email, password: pw) {(result, error) in
                if error == nil {
                    print("made account")
                    self.signIn(email: email, pw: pw)
                }
                else{
                    print("failed to login \(error.debugDescription)")
                }
            }
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        if let email = emailField.text, let pw = passwordField.text{
                signIn(email: email, pw: pw)
        }
    }
    
    
    
}

