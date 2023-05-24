//
//  Navigation bar View.swift
//  CalmCompass
//
//  Created by Nikola Gnjidic on 2023-05-22.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case person
    case gearshape
    case rectanglePortraitAndArrowForward = "rectangle.portrait.and.arrow.forward"
}
    struct Navigation_bar_View: View {
        
        
        @Binding var selectedTab: Tab
        private var fillImage: String {
            selectedTab.rawValue + ".fill"
        }
        
        
        private var tabColor: Color {
            switch selectedTab {
            case .house:
            return Color.gray
            case .person:
            return Color.gray
            case .gearshape:
            return Color.gray
            case .rectanglePortraitAndArrowForward:
            return Color.gray
                
            }
            
            
            
        }
        var body: some View {
            VStack {
                HStack {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        Spacer()
                        Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                            .foregroundColor(tab == selectedTab ? tabColor : .gray)
                            .font(.system(size: 20))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedTab = tab
                                }
                            }
                        Spacer()
                    }
                }
                .frame(width: 400, height: 80)
                .background(.thinMaterial)
                .cornerRadius(20)
                .padding()
                .offset(y:370)
            }
        }
    }
    
    
    
    
    
    
    
    
    struct Navigation_bar_View_Previews:
        PreviewProvider {
        static var previews: some View {
            Navigation_bar_View(selectedTab: .constant(.house))
            
        }
    }

