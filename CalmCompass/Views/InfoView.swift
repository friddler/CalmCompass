//
//  InfoView.swift
//  CalmCompass
//
//  Created by Marlon Garcia-Bermejo on 2023-06-01.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("CalmCompass is an iOS application designed to help users enhance their overall well-being by offering a variety of self-care tools and resources. The app is centered around several categories that promote self-improvement, including meditation, yoga, stress reduction, and happiness enhancement. With CalmCompass, users can easily select the category that best aligns with their needs and preferences, and access a range of guided meditations, yoga sequences, stress-reducing techniques, and happiness-boosting exercises. The app offers a user-friendly interface that is easy to navigate, making it accessible for individuals of all skill levels and experience. Whether you are new to self-care practices or an experienced practitioner, CalmCompass offers a personalized experience that can help you achieve your wellness goals. The app provides a convenient platform for individuals to establish daily routines and track their progress over time, helping them cultivate positive habits and foster a greater sense of well-being. With its diverse range of tools and resources, CalmCompass is an excellent choice for anyone seeking to enhance their self-care practices and achieve a greater sense of balance and happiness in their life.")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .background(Image("bgtest"))
                }
                .padding()
            }
            .navigationBarTitle(Text("Info"), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
          
        }
    }
}
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
