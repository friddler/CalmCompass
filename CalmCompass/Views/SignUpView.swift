//
//  SignUpView.swift
//  CalmCompass
//
//  Created by Edgar Backer on 2023-05-16.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    
    var auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var body: some View {
        ZStack {
            Color.white
            
            RoundedRectangle(cornerRadius: 30, style: . continuous)
                .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width:400, height:900)
            
            VStack(spacing: 20) {
                Text("  Welcome to CalmCompass")
                    .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .font(.system(size: 40, weight: .bold, design: . rounded))
                    .offset(y: -110)
                
                TextField("Email", text: $email)
                    .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                TextField("Name", text: $username)
                    .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .textFieldStyle(.plain)
                    .placeholder(when: username.isEmpty) {
                        Text("Name")
                            .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
    func register(){
        auth.createUser(withEmail: email, password: password){ result, error in
            if let error = error {
                print(error.localizedDescription)
            }else if let user = result?.user {
                saveUsername(user: user)
                //need navigation to HomeScreen after this
            }
        }
    }
    
    func saveUsername(user: User){
        let userDocument = db.collection("users").document(user.uid)
        let userData = [
            "username": username
        ]
        
        userDocument.setData(userData) {error in
            if let error = error {
                print("Error saving username: \(error.localizedDescription)")
            } else {
                print("Username saved successfully.")
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

