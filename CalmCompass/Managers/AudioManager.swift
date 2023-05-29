//
//  AudioManager.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-25.
//

import Foundation
import AVKit


final class AudioManager: ObservableObject {
//    static let shared = AudioManager()
    
    var player: AVAudioPlayer?
    @Published var isLooping: Bool = false
    @Published var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    
    func startPlayer(musicFile: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: musicFile, withExtension: "mp3") else {
            print("resource not found \(musicFile)")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview { //this bool is handling if the audio plays in the preview
                player?.prepareToPlay()
            } else {
                player?.play()
                isPlaying = true
            }
        } catch  {
            print("fail to intitalize player", error)
        }
        
    }
    
    func playPause() {
        guard let player = player else {
            print("Instance of audioplayer failed")
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
    
    func stopPlay(){
        guard let player = player else {return}
        
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }
    
    func loopMusic(){
        guard let player = player else {return}
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0 //this loop repeats forever, until the player presses again
        isLooping = player.numberOfLoops != 0
        print("isLooping", isLooping)
        
    }
}
