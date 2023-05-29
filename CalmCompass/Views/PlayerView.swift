//
//  PlayerView1.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-26.
//

import SwiftUI

struct PlayerView : View {
    
    @State var value: Double = 0.0
    @State var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var audioManager: AudioManager
    var isPreview: Bool = false
    let musicContent: MusicContent
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Image(musicContent.imageName)
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
                .opacity(0.8)
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                HStack {
                    Button {
                        audioManager.stopPlay()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                        
                    }
                    
                    Spacer()
                }
                
                Text(musicContent.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                //optional binding -
                if let player = audioManager.player {
                    VStack(spacing: 5) {
                        
                        Slider(value: $value, in: 0...player.duration) { editing in
                            
                            print("editing", editing)
                            isEditing = editing
                            
                            if !editing {
                                player.currentTime = value
                            }
                        }
                        .accentColor(.white)
                        
                        HStack {
                            
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }
                    
                    HStack {
                        //repeat
                        let color: Color = audioManager.isLooping ? .white : .white.opacity(0.4)
                        PlayBackControlButton(systemName: "repeat", color: color) {
                            audioManager.loopMusic()
                        }
                        
                        Spacer()
                        
                        //backward
                        PlayBackControlButton(systemName: "gobackward.10") {
                            player.currentTime -= 10
                        }
                        Spacer()
                        
                        //play/pause
                        PlayBackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                            
                            audioManager.playPause()
                            
                        }
                        Spacer()
                        
                        //forward
                        PlayBackControlButton(systemName: "goforward.10") {
                            player.currentTime += 10
                        }
                        
                        Spacer()
                        
                        //stop
                        PlayBackControlButton(systemName: "stop.fill") {
                            audioManager.stopPlay()
                            dismiss()
                        }
                    }
                }
            }
            .padding(20)
        }
        .onAppear {
            audioManager.startPlayer(musicFile: musicContent.musicFile, isPreview: isPreview)
        }
        .onReceive(timer){ _ in
            guard let player = audioManager.player, !isEditing else {return}
            value = player.currentTime
            
        }
        
    }
}


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(isPreview: true, musicContent: MusicContent(id: "1", title: "", imageName: "", contentInfo: "", duration: 70, musicFile: ""))
            .environmentObject(AudioManager())
            .background(Color.black)
    }
}
