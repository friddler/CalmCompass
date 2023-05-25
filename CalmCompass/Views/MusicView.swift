//
//  MusicView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-24.
//

import SwiftUI

struct MusicView: View {
    
    let title: String
    let contentInfo: String
    let categoryID: String
    
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
    }
    
    func animationCategoryChanger() -> some View{
        if categoryID == "1" {
            //happiness
            return AnyView(LottieView(loopMode: .playOnce, animationName: "sunrise")
                .scaledToFill()
                .frame(width: 40))
                
        } else if categoryID == "2" {
            //meditation
            return AnyView(Text("hej"))
        } else if categoryID == "3" {
            //stress
            return AnyView(
                LottieView(loopMode: .loop, animationName: "stressnature")
                    .scaledToFill()
                    .scaleEffect(0.5)
                    .frame(width: 40, height: 40))
            
        } else if categoryID == "4" {
            //sleep
            return AnyView(
                LottieView(loopMode: .loop, animationName: "nightsky")
                    .scaledToFill()
                    .scaleEffect(0.5)
                    .frame(width: 40, height: 40))
            
        } else if categoryID == "5" {
            //anxiety
            return AnyView(
                LottieView(loopMode: .playOnce, animationName: "hair")
                    .scaledToFill()
                    .frame(width: 40)
                    .padding(.leading, 300))
        } else {
            //yoga
            return AnyView(
                LottieView(loopMode: .loop, animationName: "yogapink")
                    .scaledToFill()
                    .frame(width: 40))
            
        }
        
    }
    
}

struct PlayerView : View {
    
    @State var value: Double = 0.0
    
    var body: some View {
        ZStack {
            LottieView(loopMode: .loop, animationName: "train")
                .scaleEffect(0.46)
                .frame(width: 40, height: 40)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                HStack {
                    Button {
                        
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
                }
                
                
            }
            .padding(20)
        }
        
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        //MusicView(title: "", contentInfo: "", categoryID: "")
        PlayerView()
    }
}
