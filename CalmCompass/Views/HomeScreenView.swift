//
//  HomeScreenView.swift
//  CalmCompass
//
//  Created by Marlon Garcia-Bermejo on 2023-05-15.
//
import SwiftUI

struct HomeScreenView: View {
    
    //var data: [Int] = Array(1...6)
   // let images = ["HapinessLogo","MeditationLogo","ReduceStressLogo","SleepLogo","anxietyLogo","Yoga"]
    let categories: [Category] = Category.categories
    
    let columns = [GridItem(.adaptive(minimum: 170))]

    @State private var tabSelected: Tab = .house

    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(categories, id: \.id) { category in
                    NavigationLink(destination: ShowCategoryView(category: category)) {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 170, height: 170)
                            Image(category.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170, height: 170)
                                .cornerRadius(20)
                                .frame(width: 17, height: 170)
                        }
                    }
                    .navigationTitle("")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                }
                

            }.overlay(Navigation_bar_View(selectedTab: $tabSelected))

            }
            .padding()
            .background(Image("bgtest"))
            
        }

    }

    
struct HomeScreenView_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreenView()
        }
    }
