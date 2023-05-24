//
//  ContentView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-10.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        NavigationView{
            //            if userIsLoggedIn {
            //                HomeScreenView()
            //                //                    logincontent
            //            }else {
            //                logincontent
            //            }
            
            //            var logincontent: some View {
            AuthViewModel.getStartedView()
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
//        Text("Requesting Notification Permission...")
            .onAppear {
                requestNotificationPermission()
            }
    }
}

func requestNotificationPermission() {
    NotificationManager.instance.requestAuthorization()
    NotificationManager.instance.scheduleNotification() // schedule Notification
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
