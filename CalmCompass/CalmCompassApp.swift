//
//  CalmCompassApp.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-10.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


@main
struct CalmCompassApp: App {
    
    @StateObject var audioManager = AudioManager()
    @StateObject var themeManager = ThemeManager.shared
    @StateObject var firestoreViewModel = FirestoreViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
                .environmentObject(themeManager)
                .environmentObject(firestoreViewModel)
                
        }
    }
}
