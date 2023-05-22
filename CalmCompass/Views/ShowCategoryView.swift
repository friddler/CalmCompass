//
//  ShowCategoryView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-15.
//

import SwiftUI

struct ShowCategoryView: View {
    
    let category: Category
    @State var showContentSheet = false
    
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
                    CategoryRowView(title: "Articles", content: category.articleContent)
                    CategoryRowView(title: "Music", content: category.musicContent)
                    CategoryRowView(title: "Exercises", content: category.exerciseContent)
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
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .padding(.leading, 10)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(content, id: \.id) { item in
                        CategoryItemView(content: item)
                    }
                }
                
            }
        }
    }
}

struct CategoryItemView: View {
    
    let content : Content
    
    var body: some View {
        NavigationLink(destination: MaterialView(title: content.title, contentInfo: content.contentInfo)) {
            Image(content.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 110)
                .cornerRadius(10)
        }
    }
}


struct ShowCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCategoryView(category: Category(id: "", title: "", imageName: "", articleContent: [], musicContent: [], exerciseContent: []))
    }
}
