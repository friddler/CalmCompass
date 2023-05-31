//
//  ArticleView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-26.
//

import SwiftUI

struct ArticleView: View {
    
    let title: String
    let contentInfo: String
    let categoryID: String
    
    @State var isScrollVisible = false
    
    var body: some View {
        ZStack {
            
            animationCategoryChanger()
            
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    Text(title)
                        .font(.title)
                        .padding(.top, 20)
                
                    Text(contentInfo)
                        .font(.body)
                        .padding()
                        
                }
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .cornerRadius(20)
                .opacity(isScrollVisible ? 1.0 : 0.0)
                
            }
            .padding(.top, 100)
            .padding(.bottom, 20)
            
        }
        .ignoresSafeArea(.all)
        .onAppear {
            withAnimation(.easeInOut(duration: 4.0)) {
                isScrollVisible = true
            }
        }
        
    }
    
    @ViewBuilder
    func animationCategoryChanger() -> some View{
        if categoryID == "1" {
            //happiness
            AnyView(LottieView(loopMode: .playOnce, animationName: "sunrise")
                .scaledToFill()
                .scaleEffect(1.3)
                .frame(width: 40))
            
        } else if categoryID == "2" {
            //meditation
            AnyView(LottieView(loopMode: .playOnce, animationName: "medit")
                .scaledToFill()
                .scaleEffect(0.5)
                .frame(width: 40))
        } else if categoryID == "3" {
            //stress
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "stressnature")
                    .scaledToFill()
                    .scaleEffect(0.5)
                    .frame(width: 40, height: 40))
            
        } else if categoryID == "4" {
            //sleep
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "nightsky")
                    .scaledToFill()
                    .scaleEffect(0.5)
                    .frame(width: 40, height: 40))
            
        } else if categoryID == "5" {
            //anxiety
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "hair")
                    .scaledToFill()
                    .frame(width: 40)
                    .padding(.leading, 300))
        } else {
            //yoga
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "yogapink")
                    .scaledToFill()
                    .frame(width: 40))
            
        }
        
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(title: "Hello", contentInfo: "Hello", categoryID: "2")
    }
}
