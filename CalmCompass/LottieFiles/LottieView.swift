//
//  LottieView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-11.
//

import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    
    
    let loopMode: LottieLoopMode
    let animationName: String
    
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationName)
        animationView.loopMode = loopMode
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
        
    }
}
