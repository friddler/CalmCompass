////
////  LoginView.swift
////  CalmCompass
////
////  Created by Edgar Backer on 2023-05-16.
////
//
//import SwiftUI
//import Firebase
//
//struct LoginView: View {
//
//    @State private var email = ""
//    @State private var password = ""
//    @State private var navigateToHome = false
//
//    var auth = Auth.auth()
//
//
//    var body: some View {
//        NavigationView{
//            inlogningView()
//        }
//    }
////    func login(){
////            auth.signIn(withEmail: email, password: password) { result, error in
////                if error != nil {
////                    print(error?.localizedDescription)
////                    //need navigation to HomeScreen after this
////
////                }
////            }
////        }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
//
//struct inlogningView: View {
//
//    @State private var email = ""
//    @State private var password = ""
//    @State private var navigateToHome = false
//
//    var auth = Auth.auth()
//
//    var body: some View {
//        ZStack {
//            Color.white
//
//            RoundedRectangle(cornerRadius: 30, style: . continuous)
//                .foregroundStyle(.linearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
//                .frame(width:400, height:900)
//
//            VStack(spacing: 20) {
//                Text("Welcome Back")
//                    .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .font(.system(size: 40, weight: .bold, design: . rounded))
//                    .offset(y: -70)
//
//                Image("meditationLogin")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 500, height: 300)
//                    .padding(.vertical, 10)
//
//                TextField("Email", text: $email)
//                    .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .textFieldStyle(.plain)
//                    .placeholder(when: email.isEmpty) {
//                        Text("Email")
//                            .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
//                            .bold()
//                    }
//
//                Rectangle()
//                    .frame(width: 350, height: 1)
//                    .foregroundColor(.white)
//
//                SecureField("Password", text: $password)
//                    .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .textFieldStyle(.plain)
//                    .placeholder(when: password.isEmpty){
//                        Text("Password")
//                            .foregroundStyle(.linearGradient(colors: [ .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
//                            .bold()
//                    }
//
//                Rectangle()
//                    .frame(width: 350, height: 1)
//                    .foregroundColor(.white)
//
//                Button {
//                    auth.signIn(withEmail: email, password: password) { result, error in
//                        if error != nil {
//                            print(error?.localizedDescription)
//                            //need navigation to HomeScreen after this
//
//                        }
//                    }
//                    navigateToHome = true
//                } label: {
//                    Text("Login")
//                        .bold()
//                        .frame(width: 200, height: 40)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10, style: .continuous)
//                                .fill(.linearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
//                        )
//                        .foregroundColor(.white)
//                }
//                .padding(.top)
//                .offset(y: 10)
//            }
//            .frame(width: 350)
//        }
//        .ignoresSafeArea()
//        .navigationBarHidden(true)
//        .navigationTitle("")
//        .navigationBarTitleDisplayMode(.inline)
//        .background( NavigationLink(destination: HomeScreenView(), isActive: $navigateToHome) {
//            EmptyView()
//        })
//    }
//}
//
