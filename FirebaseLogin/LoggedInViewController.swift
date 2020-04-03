//
//  LoggedInViewController.swift
//  FirebaseLogin
//
//  Created by admin on 03/04/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoggedInViewController: UIViewController {
    
    var auth = Auth.auth()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        try! auth.signOut()
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "viewcontroller") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

        
        
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
