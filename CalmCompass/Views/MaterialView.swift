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
    let content: Content
  
    
    var body: some View {
        VStack {
            if let musicContent = content as? MusicContent {
                MusicView(title: title, contentInfo: contentInfo, categoryID: categoryID, musicContent: musicContent)
            } else if let exerciseContent = content as? ExerciseContent {
                ExerciseView(title: title, contentInfo: contentInfo, categoryID: categoryID, exerciseContent: exerciseContent)
            } else {
                ArticleView(title: title, contentInfo: contentInfo, categoryID: categoryID)
            }
        }
    }
}


//struct MaterialView_Previews: PreviewProvider {
//    static var previews: some View {
////        MaterialView(title: "", contentInfo: "", categoryID: "", content: "" as! Content)
//    }
//}
