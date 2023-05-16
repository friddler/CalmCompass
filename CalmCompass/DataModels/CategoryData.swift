//
//  Category.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-16.
//

import Foundation

struct Content {
    let id: String
    let title: String
    let imageName: String
    let contentInfo: String
}

struct Category {
    let id: String
    let title: String
    let imageName: String
    var content: [Content]
    
    static let categories: [Category] = [
        
        Category(id: "happinessCat", title: "Happiness", imageName: "HapinessLogo", content: [
            Content(id: "articleH1", title: "Happiness Article", imageName: "HapinessLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "meditationCat", title: "Meditation", imageName: "MeditationLogo", content: [
            Content(id: "articleM1", title: "Meditation Article", imageName: "MeditationLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "stressCat", title: "Stress", imageName: "ReduceStressLogo", content: [
            Content(id: "articleS1", title: "Happiness Article", imageName: "ReduceStressLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "sleepCat", title: "Sleep", imageName: "SleepLogo", content: [
            Content(id: "articleSL1", title: "Happiness Article", imageName: "SleepLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "anxietyCat", title: "Anxiety", imageName: "anxietyLogo", content: [
            Content(id: "articleA1", title: "Happiness Article", imageName: "anxietyLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "yogaCat", title: "Yoga", imageName: "yoga", content: [
            Content(id: "articleY1", title: "Happiness Article", imageName: "yoga", contentInfo: "This is test content")
        ])
    ]
}
