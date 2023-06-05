//
//  Navigation bar View.swift
//  CalmCompass
//
//  Created by Nikola Gnjidic on 2023-05-22.
//

import SwiftUI
import Firebase

enum Tab: String, CaseIterable {
    case house
    case person
    case gearshape
    case map
    case rectanglePortraitAndArrowForward = "rectangle.portrait.and.arrow.forward"}


struct Navigation_bar_View: View {
    
    
    @Binding var selectedTab: Tab
    @State var isActive = false
    @StateObject private var auth = AuthViewModel()
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return Color.blue
        case .person:
            return Color.orange
        case .gearshape:
            return Color.purple
        case .map:
            return Color.green
        case .rectanglePortraitAndArrowForward:
            return Color.gray
            
        }
    
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Button(action: {
                        selectedTab = tab
                        isActive = true
                    }) {
                        Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                            .foregroundColor(tab == selectedTab ? tabColor : .gray)
                            .font(.system(size: 20))
                    }
                    Spacer()
                }
            }
            .frame(width: 400, height: 90)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding()
            .offset(y:370)
            .fullScreenCover(isPresented: $isActive) {
                getViewForTab(selectedTab)
            }
        }
    }
    
    func getViewForTab(_ tab: Tab) -> some View {
        switch tab {
        case .house:
            return AnyView(HomeScreenView())
        case .person:
            return AnyView(ProfilePageView())
        case .gearshape:
            return AnyView(SettingsView())
        case .map:
            return AnyView(MapsView())
        case .rectanglePortraitAndArrowForward:
            auth.logout()
            return AnyView(ContentView())
        }
    }
}
struct Navigation_bar_View_Previews:
    PreviewProvider {
    static var previews: some View {
        Navigation_bar_View(selectedTab: .constant(.house))
        
    }
}

