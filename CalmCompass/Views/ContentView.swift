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
        NavigationView{
            //            if userIsLoggedIn {
            //                HomeScreenView()
            //                //                    logincontent
            //            }else {
            //                logincontent
            //            }
            
            //            var logincontent: some View {
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
                    
                    NavigationLink(destination: SignUpView()) {
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
                    
                    NavigationLink(destination: LoginView()) {
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
