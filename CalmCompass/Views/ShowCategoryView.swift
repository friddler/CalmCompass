//
//  ShowCategoryView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-15.
//

import SwiftUI

struct ShowCategoryView: View {
    
    let category: Category
    
    var body: some View {
        VStack {
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 270)
                .edgesIgnoringSafeArea(.top)
            
            Spacer(minLength: 70)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    CategoryRowView(title: "Articles", content: category.articleContent, categoryID: category.id)
                    CategoryRowView(title: "Music", content: category.musicContent, categoryID: category.id)
                    CategoryRowView(title: "Exercises", content: category.exerciseContent, categoryID: category.id)
                }
                .padding(.leading, 10)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
}

struct CategoryRowView: View {
    
    let title: String
    let content: [Content]
    let categoryID: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .padding(.leading, 10)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(content, id: \.id) { item in
                        CategoryItemView(content: item, categoryID: categoryID)
                    }
                }
                
            }
        }
    }
}

struct CategoryItemView: View {
    
    let content : Content
    let categoryID: String
    
    var body: some View {
        NavigationLink(destination: ArticleView(title: content.title, contentInfo: content.contentInfo, categoryID: categoryID)) {
            VStack {
                Image(content.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 110)
                    .cornerRadius(10)
                
                Text(content.title)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(Color.black)
            }
            
        }
    }
}


struct ShowCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleCategory = Category(
            id: "1",
            title: "Example Category",
            imageName: "exampleImage",
            articleContent: [
                ArticleContent(id: "1", title: "Example article happiness", imageName: "SleepLogo", contentInfo: "Article 1 Info"),
                ArticleContent(id: "2", title: "Example Article 2", imageName: "SleepLogo", contentInfo: "Article 2 Info")
            ],
            musicContent: [
                MusicContent(id: "1", title: "Example Music 1", imageName: "SleepLogo", contentInfo: "Music 1 Info", musicFile: "music1File"),
                MusicContent(id: "2", title: "Example Music 2", imageName: "SleepLogo", contentInfo: "Music 2 Info", musicFile: "music2File")
            ],
            exerciseContent: [
                ExerciseContent(id: "1", title: "Example Exercise 1", imageName: "SleepLogo", contentInfo: "Exercise 1 Info", videoURL: URL(string: "https://example.com/exercise1"))
            ]
        )
        
        return ShowCategoryView(category: exampleCategory)
    }
}
