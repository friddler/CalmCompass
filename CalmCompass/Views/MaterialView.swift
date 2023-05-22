//
//  MaterialView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-18.
//

import SwiftUI

struct MaterialView: View {
    
    let title: String
    let contentInfo: String
    let categoryID: String
    
    @State var isScrollVisible = false
    
    var body: some View {
        ZStack {
            
            LottieView(loopMode: .playOnce, animationName: "moon")
                .scaledToFill()
                .scaleEffect(0.5)
                .frame(width: 40, height: 40)
            
            if categoryID == "1" {
                //happiness
            } else if categoryID == "2" {
                //meditation
            } else if categoryID == "3" {
                //stress
                LottieView(loopMode: .loop, animationName: "naturedark")
                    .scaledToFill()
                    .scaleEffect(0.5)
                    .frame(width: 40, height: 40)
                
            } else if categoryID == "4" {
                //sleep
                LottieView(loopMode: .loop, animationName: "nightsky")
                    .scaledToFill()
                    .scaleEffect(0.5)
                    .frame(width: 40, height: 40)
                
            } else if categoryID == "5" {
                //anxiety
            } else {
                //yoga
                
            }
            
            ScrollView {
                VStack(spacing: 20) {
                    Text(title)
                        .font(.title)
                    
                    CardView(contentInfo: contentInfo)
                        .padding()
                }
                .padding(.top, 70)
                .opacity(isScrollVisible ? 1.0 : 0.0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 5.0)) {
                        isScrollVisible = true
                    }
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct CardView: View {
    
    let contentInfo: String
    
    var body: some View {
        VStack {
            Text(contentInfo)
                .font(.body)
                .padding()
            
                
            
        }
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y:5)
        .cornerRadius(20)
        
    }
}

struct MaterialView_Previews: PreviewProvider {
    static var previews: some View {
        MaterialView(title: "Sleep myths and truths", contentInfo: "How much sleep you need changes with age. Experts recommend school-age children get at least nine hours a night and teens get between eight and 10. Most adults need at least seven hours or more of sleep each night.There are many misunderstandings about sleep. One is that adults need less sleep as they get older. This isn’t true. Older adults still need the same amount. But sleep quality can get worse as you age. Older adults are also more likely to take medications that interfere with sleep. Another sleep myth is that you can “catch up” on your days off. Researchers are finding that this largely isn’t the case. “If you have one bad night’s sleep and take a nap, or sleep longer the next night, that can benefit you,” says Wright. “But if you have a week’s worth of getting too little sleep, the weekend isn’t sufficient for you to catch up. That’s not a healthy behavior.”In a recent study, Wright and his team looked at people with consistently deficient sleep. They compared them to sleep-deprived people who got to sleep in on the weekend. Both groups of people gained weight with lack of sleep. Their bodies’ ability to control blood sugar levels also got worse. The weekend catch-up sleep didn’t help.On the flip side, more sleep isn’t always better, says Brown. For adults, “if you’re sleeping more than nine hours a night and you still don’t feel refreshed, there may be some underlying medical issue,” she explains.", categoryID: "1")
    }
}
