//
//  FirebaseManager.swift
//  FirebaseLogin
//
//  Created by admin on 03/04/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Firebase

var auth = Auth.auth()

func signIn(email:String, pw:String){
    auth.signIn(withEmail: email, password: pw) { (result, error) in
        if error == nil{
            print("logged in")
            let vc = ViewController().storyboard!.instantiateViewController(withIdentifier: "loggedinvc") as! LoggedInViewController
            vc.modalPresentationStyle = .fullScreen
            ViewController().present(vc, animated: true, completion: nil)
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
                signIn(email: email, pw: pw)
            }
            else{
                print("failed to login \(error.debugDescription)")
            }
        }
}


