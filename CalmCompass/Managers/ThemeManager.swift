//
//  ThemeManager.swift
//  CalmCompass
//
//  Created by Marlon Garcia-Bermejo on 2023-05-29.
//

import Foundation
import Combine
import UIKit

class ThemeManager: ObservableObject {
    static let shared = ThemeManager()
    
    @Published var isDarkMode = false
    
    private init() {}
    
    func handleTheme() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        
        let windows = windowScene.windows
        
        if isDarkMode {
            // Apply dark theme
            windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
        } else {
            // Apply light theme
            windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
        }
    }
}
