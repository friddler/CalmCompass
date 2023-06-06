//
//  AuthViewModel.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-11.
//

import Foundation
import Firebase
import SwiftUI

class AuthViewModel: ObservableObject {
    
    var auth = Auth.auth()
    
    private var email = ""
    private var password = ""
    @Published var isAuthenticated = false
    
    
    
    //functions for handling authentication
    
    func logout() {
            do {
                try auth.signOut()
                // Perform any additional logout-related tasks if needed
            } catch {
                print("Error signing out: \(error.localizedDescription)")
            }
        }
    
    struct getStartedView: View {
        @State private var email = ""
        @State private var password = ""
        @State private var userIsLoggedIn = false
        var auth = Auth.auth()
        
        var body: some View {
            ZStack {
                Color.white
                
                RoundedRectangle(cornerRadius: 30, style: . continuous)
                    .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:400, height:900)
                
                VStack(spacing: 20) {
                    
                    Image("startScreen")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 300)
                        .offset(y: -50)
                        .overlay(
                            Image("LetsLogin"))
                        .scaledToFit()
                        .frame(width: 400, height: 200)
                    
                    Text("Let us be your CalmCompass")
                        .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .font(.system(size: 40, weight: .bold, design: . rounded))
                        .offset(y: 20)
                    
                    NavigationLink(destination: SignedUpView()) {
                        Text("Sign Up")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
                            )
                            .foregroundColor(.white)
                            .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true)
                    }
                    .padding(.top)
                    .offset(y: 100)
                    
                    NavigationLink(destination: inlogningView()) {
                        Text("Already have an account? Login")
                            .bold()
                            .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    }
                    .padding(.top)
                    .offset(y: 110)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .navigationTitle("")
                    
                }
                .frame(width: 350)
                .onAppear{
                    Auth.auth().addStateDidChangeListener{auth, user in
                        if user != nil {
                            userIsLoggedIn.toggle()
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
 
    struct inlogningView: View {
        
        @State private var email = ""
        @State private var password = ""
        @State private var navigateToHome = false
        
        var auth = Auth.auth()
//        var isSignInButtonDisabled: Bool {
//            [email, password].contains(where: \.isEmpty)
//        }
        
        var body: some View {
            ZStack {
                Color.white
                
                RoundedRectangle(cornerRadius: 30, style: . continuous)
                    .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:400, height:900)
                
                VStack(spacing: 20) {
                    Text("Welcome Back")
                        .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .font(.system(size: 40, weight: .bold, design: . rounded))
                        .offset(y: -70)
                    
                    Image("meditationLogin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 300)
                        .padding(.vertical, 10)
                    
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
                    
                    Button(action: {
                        auth.signIn(withEmail: email, password: password) { result, error in
                            if let error = error {
                                print(error.localizedDescription)
                                //login failed
                            }else if result?.user != nil {
                                //Login succesful
                                navigateToHome = true
                            }
                            }
                        }) {
                        Text("Login")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y: 10)
                    .disabled(email.isEmpty || password.isEmpty) // disable Button
                }
                .frame(width: 350)
            }
            .ignoresSafeArea()
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .background( NavigationLink(destination: HomeScreenView(), isActive: $navigateToHome) {
                EmptyView()
            }
                .navigationBarHidden(false)// possible to hide bar but navigation wise it is more handy to at least go back with just the blue arrow
                    .navigationBarBackButtonHidden(false))
        }
    }
    
    struct SignedUpView: View {
        
        @State private var email = ""
        @State private var password = ""
        @State private var username = ""
        @State private var navigateToHome = false
        
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
                        auth.createUser(withEmail: email, password: password){ result, error in
                            if let error = error {
                                print(error.localizedDescription)
                            }else if let user = result?.user {
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
                                //need navigation to HomeScreen after this
                                navigateToHome = true
                            }
                        }
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
                NavigationLink(destination: HomeScreenView(), isActive: $navigateToHome) {
                    EmptyView()
                }
                .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
            .ignoresSafeArea()
        }
    }
    
}
