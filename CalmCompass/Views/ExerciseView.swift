//
//  ExerciseView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-29.
//

import SwiftUI
import WebKit

struct ExerciseView: View {
    
    let title: String
    let contentInfo: String
    let categoryID: String
    let exerciseContent: ExerciseContent
    
    var body: some View {
        VStack {
            
    
            
            VStack {
                
                Color(red: 31/255, green: 49/255, blue: 70/255)
                
                VStack(alignment: .leading, spacing: 24){
                    
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Exercise")
                        
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text(title)
                        .font(.title)
                    
                    
                    Text(contentInfo)
                    
                    Spacer()
                    
                }
                .foregroundColor(.white)
                .padding(20)
                
            }
        }
    }
}

struct VideoView: UIViewRepresentable {
    
    let exerciseContent : ExerciseContent
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let videoURL = URL(string: "https://www.youtube.com/embed/\(String(describing: exerciseContent.videoURL))") else {return}
        uiView.load(URLRequest(url: videoURL))
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(title: "Exercise 1", contentInfo: "This is a exercise", categoryID: "1", exerciseContent: ExerciseContent(id: "", title: "", imageName: "", contentInfo: "", videoURL: URL(string: "https://www.youtube.com/watch?v=CM43AZaRXNw")))
    }
}
