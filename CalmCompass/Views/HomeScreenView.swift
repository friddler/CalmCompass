//
//  HomeScreenView.swift
//  CalmCompass
//
//  Created by Marlon Garcia-Bermejo on 2023-05-15.
//
import SwiftUI

struct HomeScreenView: View {
    
    var data: [Int] = Array(1...6)
    let images = ["HapinessLogo","MeditationLogo","ReduceStressLogo","SleepLogo","anxietyLogo","Yoga"]
    let columns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 170, height: 170)
                            Image(images[number-1])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170, height: 170)
                                .cornerRadius(20)
                                .frame(width: 17, height: 170)
                        }
                    }
                }
                
            }
            .padding()
            .navigationTitle("Welcome home")
            .background(Image("bgtest"))
                   
            

        }
    }
}
    
struct HomeScreenView_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreenView()
        }
    }
