//
//  ShowCategoryView.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-15.
//

import SwiftUI

struct ShowCategoryView: View {
    
    let categoryImage: String
    
    var body: some View {
        VStack {
            Image("sleep")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 270)
                .edgesIgnoringSafeArea(.top)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    CategoryRowView(title: "Articles", imageName: "yoga")
                    CategoryRowView(title: "Music", imageName: "meditation")
                    CategoryRowView(title: "Exercises", imageName: "sleep")
                }
                .padding(.leading, 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CategoryRowView: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("title")
                .font(.title)
                .padding(.leading, 10)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<10) { _ in
                        CategoryItemView(imageName: imageName)
                    }
                    
                }
                
                
            }
        }
    }
}

struct CategoryItemView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 170, height: 110)
            .cornerRadius(10)
            .onTapGesture {
                // Handle item tap action
            }
    }
}

struct ShowCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCategoryView(categoryImage: "sleepImage")
    }
}
