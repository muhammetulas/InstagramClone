//
//  AuthorizationViewModel.swift
//  InstagramClone
//
//  Created by M Kaan Adanur on 24.03.2022.
//

import Foundation
import FirebaseAuth

struct AuthorizationViewModel {
    
    static var errorOuput: String = ""
    
    var user = LoginModel(userMail: "", userPassword: "")
    
    func login(email: String, password: String, completion: @escaping (Bool?) -> Void) {
        FirebaseServices().userLogin(user: LoginModel(userMail: email, userPassword: password)) { result in
            if let result = result {
                if result == true {
                    completion(true)
                } else {
                  completion(false)
                }
            }
        }
    }
    
}

extension AuthorizationViewModel {
    var mail: String {
        return self.user.userMail
    }
    
    var password: String {
        return self.user.userPassword
    }
}
