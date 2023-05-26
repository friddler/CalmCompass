//
//  AudioManager.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-25.
//

import Foundation
import AVKit

final class AudioManager {
    static let shared = AudioManager()
    
    var player: AVAudioPlayer?
    
    func startPlayer(musicFile: String) {
        guard let url = Bundle.main.url(forResource: musicFile, withExtension: "mp3") else {
            print("resource not found \(musicFile)")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch  {
            print("fail to intitalize player", error)
        }
        
    }
}
