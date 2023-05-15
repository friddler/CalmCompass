//
//  AuthViewModel.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-11.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    var auth = Auth.auth()
    
    private var email = ""
    private var password = ""
    
    
    
    //functions for handling authentication
    
//    func login(){
//        auth.signIn(withEmail: email, password: password) { result, error in
//            if error != nil {
//                print(error?.localizedDescription)
//            }
//        }
//    }
//    
//    func register(){
//        auth.createUser(withEmail: email, password: password){ result, error in
//            if error != nil {
//                print(error?.localizedDescription)
//            }
//            
//        }
//    }
}

