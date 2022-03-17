//
//  AuthorizationViewController.swift
//  InstagramClone
//
//  Created by M Kaan Adanur on 17.03.2022.
//

import Foundation
import UIKit

class AuthorizationViewController: UIViewController {
    
    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designSetup()
    }
    
    @IBAction func barBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension AuthorizationViewController {
    
    func designSetup() {
        footerView.layer.borderWidth = 1
        footerView.layer.borderColor = UIColor.black.cgColor
    }
    
}
