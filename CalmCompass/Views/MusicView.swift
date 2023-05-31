//
//  MusicView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-24.
//

import SwiftUI

struct MusicView: View {
    
    @State var showPlayer = false
    
    let title: String
    let contentInfo: String
    let categoryID: String
    let musicContent: MusicContent
    
    
    @ViewBuilder
    var backgroundColor: some View {
        switch categoryID {
        case "1": //happiness
            Color(red: 199/255, green: 88/255, blue: 32/255)
        case "2": //meditation
            Color(red: 34/255, green: 77/255, blue: 15/255)
        case "3": //stress
            Color(red: 143/255, green: 106/255, blue: 76/255)
        case "4": // sleep
            Color(red: 20/255, green: 15/255, blue: 47/255)
        case "5": //anxiety
            Color(red: 31/255, green: 49/255, blue: 70/255)
        case "6": //yoga
            Color(red: 187/255, green: 102/255, blue: 102/255)
        default:
            Color(red: 28/255, green: 22/255, blue: 40/255)
        }
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            animationCategoryChanger()
            
            ZStack {
                
                backgroundColor
                
                VStack(alignment: .leading, spacing: 24){
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Music")
                        
                        Text(DateComponentsFormatter.abbreviated.string(from: musicContent.duration) ?? musicContent.duration.formatted() + "S")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text(title)
                        .font(.title)
                    
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                    
                    Text(contentInfo)
                    
                    Spacer()
                    
                }
                .foregroundColor(.white)
                .padding(20)
                
            }
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(musicContent: musicContent)
        }
    }
    
    @ViewBuilder
    func animationCategoryChanger() -> some View {
        if categoryID == "1" {
            // Happiness
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "sunrise")
                    .scaleEffect(1.8)
                    .frame(width: 150)
            )
        } else if categoryID == "2" {
            // Meditation
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "medit")
                    .scaleEffect(0.3)
                    .padding(.bottom, 100)
                    .frame(width: 150, height: 426)
            )
        } else if categoryID == "3" {
            // Stress
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "stressnature")
                    .scaleEffect(0.4)
                    .frame(width: 150, height: 426)
            )
        } else if categoryID == "4" {
            // Sleep
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "nightsky")
                    .scaleEffect(0.4)
                    .frame(width: 150, height: 426)
            )
        } else if categoryID == "5" {
            // Anxiety
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "hair")
                    .padding(.horizontal)
                    .frame(width: 150, height: 426)
            )
        } else {
            // Yoga
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "yogapink")
                    .scaleEffect(1.42)
                    .frame(width: 150, height: 426)
            )
        }
    }
}


struct PlayBackControlButton: View {
    
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
        
        
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
       MusicView(title: "", contentInfo: "", categoryID: "2", musicContent: MusicContent(id: "2", title: "", imageName: "", contentInfo: "", duration: 70, musicFile: ""))
            .environmentObject(AudioManager())
        //PlayBackControlButton(action: {})
          //  .preferredColorScheme(.dark)
    }
}
