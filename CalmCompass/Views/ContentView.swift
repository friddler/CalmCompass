//
//  ContentView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-10.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var auth = Auth.auth()
    
    var body: some View {
        if userIsLoggedIn {
            HomeScreenView()
//            logincontent
        }else {
            logincontent
        }
    }
    
    var logincontent: some View {
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
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                .padding(.top)
                .offset(y: 110)


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
    
    func login(){
        auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }

    func register(){
        auth.createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error?.localizedDescription)
            }
            

        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment){
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
