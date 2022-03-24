//
//  AuthorizationViewController.swift
//  InstagramClone
//
//  Created by M Kaan Adanur on 17.03.2022.
//

import Foundation
import UIKit
import FirebaseAuth

class AuthorizationViewController: UIViewController {
    
    @IBOutlet weak var userMail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    var viewModel: AuthorizationViewModel = AuthorizationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        viewModel.login(email: userMail.text!, password: userPassword.text!) { result in
            if result! == true {
                self.performSegue(withIdentifier: "toFeedFromAuth", sender: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: AuthorizationViewModel.errorOuput, preferredStyle: .alert)
                let okButton = UIAlertAction.init(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated:true, completion: nil)
            }
        }
    }

}
