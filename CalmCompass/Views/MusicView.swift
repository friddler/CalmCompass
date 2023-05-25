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
   
    
    var body: some View {
        VStack(spacing: 0) {
            
            LottieView(loopMode: .loop, animationName: "train")
                .scaleEffect(0.4)
                .padding(.bottom, 270)
                .frame(height: UIScreen.main.bounds.height / 2)
                
            ZStack {
                Color(red: 28/255, green: 22/255, blue: 40/255)
                
                VStack(alignment: .leading, spacing: 24){
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Music")
                        
                        Text("0s")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text("Here it can say something")
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
                    
                    
                    Text("Here it can say something about the music depending on the category")
                    
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
    func animationCategoryChanger() -> some View{
        if categoryID == "1" {
            //happiness
            AnyView(LottieView(loopMode: .playOnce, animationName: "sunrise")
                .scaleEffect(0.4)
                .padding(.bottom, 270)
                .frame(height: UIScreen.main.bounds.height / 2))
            
        } else if categoryID == "2" {
            //meditation
            AnyView(Text("hej"))
        } else if categoryID == "3" {
            //stress
            AnyView(
                LottieView(loopMode: .loop, animationName: "stressnature")
                    .scaleEffect(0.4)
                    .padding(.bottom, 270)
                    .frame(height: UIScreen.main.bounds.height / 2))
            
        } else if categoryID == "4" {
            //sleep
            AnyView(
                LottieView(loopMode: .loop, animationName: "nightsky")
                    .scaleEffect(0.4)
                    .padding(.bottom, 270)
                    .frame(height: UIScreen.main.bounds.height / 2))
            
        } else if categoryID == "5" {
            //anxiety
            AnyView(
                LottieView(loopMode: .playOnce, animationName: "hair")
                    .scaleEffect(0.4)
                    .padding(.bottom, 270)
                    .frame(height: UIScreen.main.bounds.height / 2))
        } else {
            //yoga
            AnyView(
                LottieView(loopMode: .loop, animationName: "yogapink")
                    .scaleEffect(0.4)
                    .padding(.bottom, 270)
                    .frame(height: UIScreen.main.bounds.height / 2))
            
        }
        
    }
    
}

struct PlayerView : View {
    
    @State var value: Double = 0.0
    @Environment(\.dismiss) var dismiss
    let musicContent: MusicContent
    
    var body: some View {
        ZStack {
            LottieView(loopMode: .loop, animationName: "train")
                .scaleEffect(0.46)
                .frame(width: 40, height: 40)
                .ignoresSafeArea()
            
            
            VStack(spacing: 32) {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                        
                    }
                    
                    Spacer()
                }
                
                Text("1 minute relaxing meditation")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 5) {
                    Slider(value: $value, in: 0...60)
                        .accentColor(.white)
                    
                    HStack {
                        Text("0.00")
                        
                        Spacer()
                        
                        Text("1:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                
                HStack {
                    //repeat
                    PlayBackControlButton(systemName: "repeat") {
                        
                    }
                    
                    Spacer()
                    
                    //backward
                    PlayBackControlButton(systemName: "gobackward.10") {
                        
                    }
                    Spacer()
                    
                    //play/pause
                    PlayBackControlButton(systemName: "play.circle.fill", fontSize: 44) {
                        
                    }
                    Spacer()
                    
                    //forward
                    PlayBackControlButton(systemName: "goforward.10") {
                        
                    }
                    
                    Spacer()
                    
                    //stop
                    PlayBackControlButton(systemName: "stop.fill") {
                        
                    }
                }
                
                
            }
            .padding(20)
        }
        .onAppear {
            AudioManager.shared.startPlayer(musicFile: musicContent.musicFile)
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
        MusicView(title: "", contentInfo: "", categoryID: "", musicContent: MusicContent(id: "1", title: "", imageName: "", contentInfo: "", duration: 70, musicFile: ""))
        //PlayerView()
        //PlayBackControlButton(action: {})
          //  .preferredColorScheme(.dark)
    }
}
