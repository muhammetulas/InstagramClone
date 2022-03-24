//
//  FirebaseServices.swift
//  InstagramClone
//
//  Created by M Kaan Adanur on 24.03.2022.
//

import Foundation
import FirebaseAuth

class FirebaseServices {
    
    func userLogin(user: LoginModel, completion: @escaping (Bool?) -> Void) {
        Auth.auth().signIn(withEmail: user.userMail, password: user.userPassword) { result, error in
            if let error = error {
                print(error.localizedDescription)
                AuthorizationViewModel.errorOuput = error.localizedDescription
                completion(false)
            } else if let result = result {
                print(result.user.email!)
                completion(true)
            }
        }
    }
    
}
