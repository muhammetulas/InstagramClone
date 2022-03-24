//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by M Kaan Adanur on 15.03.2022.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginVC loaded.")
    }
    
    @IBAction func switchAccounsClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toAuthFromLogin", sender: nil)
        } catch {
            let alert = UIAlertController(title: "Error", message: "Logout failed.", preferredStyle: .alert)
            let okButton = UIAlertAction.init(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated:true, completion: nil)
            
        }
    }
}
