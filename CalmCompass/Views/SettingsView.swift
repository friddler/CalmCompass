//
//  SettingsView.swift
//  CalmCompass
//
//  Created by Marlon Garcia-Bermejo on 2023-05-24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var selectedTab: Tab = .gearshape
    @State private var notificationsEnabled = true
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Display"),
                            footer: Text("Dark mode will change the application's color theme")) {
                        Toggle(isOn: $notificationsEnabled, label: {
                            Text("Notifications")
                        })
                        
                        Toggle(isOn: $themeManager.isDarkMode, label: {
                            Text("Dark mode")
                        })
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .background(Image("settingsbackground").resizable().scaledToFill())
            .navigationBarTitle("Settings")
        }
        .overlay(Navigation_bar_View(selectedTab: $selectedTab))
        .environment(\.colorScheme, themeManager.isDarkMode ? .dark : .light)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ThemeManager.shared)
    }
}
