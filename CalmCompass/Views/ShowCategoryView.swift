//
//  ShowCategoryView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-15.
//

import SwiftUI

struct ShowCategoryView: View {
    
    let category: Category
    @EnvironmentObject var firestoreViewModel: FirestoreViewModel
    
    @ViewBuilder
    var backgroundColor: some View {
        switch category.id {
        case "1": //happiness
            Color(red: 254/255, green: 244/255, blue: 235/255)
        case "2": //meditation
            Color(red: 253/255, green: 231/255, blue: 218/255)
        case "3": //stress
            Color(.white)
        case "4": // sleep
            Color(.white)
        case "5": //anxiety
            Color(red: 101/255, green: 169/255, blue: 176/255)
        case "6": //yoga
            Color(red: 248/255, green: 235/255, blue: 242/255)
        default:
            Color(red: 28/255, green: 22/255, blue: 40/255)
        }
    }
    
    var body: some View {
        VStack {
            Image(category.categoryImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSizeForCategory(category).width, height: imageSizeForCategory(category).height)
                .edgesIgnoringSafeArea(.top)
                .padding(.trailing, category.id == "5" ? 120 : 0)
            
            Spacer(minLength: 20)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    CategoryRowView(title: "Articles", content: category.articleContent, categoryID: category.id)
                    CategoryRowView(title: "Music", content: category.musicContent, categoryID: category.id)
                    CategoryRowView(title: "Exercises", content: category.exerciseContent, categoryID: category.id)
                }
                .padding(.leading, 10)
                .padding(.bottom, 50)
            }
            .background(backgroundColor)
        }
        .edgesIgnoringSafeArea(.all)
        .background(backgroundColor)
     
    }
    
    func imageSizeForCategory(_ category: Category) -> CGSize {
        switch category.id {
        case "1":
            return CGSize(width: 400, height: 400)
        case "2":
            return CGSize(width: 400, height: 400)
        case "3":
            return CGSize(width: 700, height: 300)
        case "4":
            return CGSize(width: 700, height: 300)
        case "5":
            return CGSize(width: 700, height: 350)
        case "6":
            return CGSize(width: 700, height: 300)
        default:
            return CGSize(width: 270, height: 400)
        }
    }
    
}

struct CategoryRowView: View {
    
    let title: String
    let content: [Content]
    let categoryID: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("Merriweather-Bold", size: 25))
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
        NavigationLink(destination: MaterialView(title: content.title, contentInfo: content.contentInfo, categoryID: categoryID, content: content)) {
            VStack {
                Image(content.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 110)
                    .cornerRadius(10)
                
                Text(content.title)
                    .font(.custom("Merriweather-Regular", size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
            }
            
        }
        
    }
}


struct ShowCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleCategory = Category(
            id: "6",
            title: "Example Category",
            imageName: "exampleImage", categoryImage: "YogaCategory",
            articleContent: [
                ArticleContent(id: "1", title: "Example article happiness", imageName: "SleepLogo", contentInfo: "Article 1 Info"),
                ArticleContent(id: "2", title: "Example Article 2", imageName: "SleepLogo", contentInfo: "Article 2 Info")
            ],
            musicContent: [
                MusicContent(id: "1", title: "Example Music 1", imageName: "SleepLogo", contentInfo: "Music 1 Info", duration: 70, musicFile: "music1File"),
                MusicContent(id: "2", title: "Example Music 2", imageName: "SleepLogo", contentInfo: "Music 2 Info", duration: 70, musicFile: "music2File")
            ],
            exerciseContent: [
                ExerciseContent(id: "1", title: "Example Exercise 1", imageName: "SleepLogo", contentInfo: "Exercise 1 Info", videoURL: "https://example.com/exercise1")
            ]
        )
        
        return ShowCategoryView(category: exampleCategory)
    }
}
