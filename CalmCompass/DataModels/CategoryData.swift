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
            Content(id: "articleH1", title: "Happiness Article", imageName: "HapinessLogo", contentInfo: "This is test content"), Content(id: "articleH2", title: "Happiness Article 2", imageName: "HapinessLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "meditationCat", title: "Meditation", imageName: "MeditationLogo", content: [
            Content(id: "articleM1", title: "Meditation Article", imageName: "meditation", contentInfo: "This is test content"),
            Content(id: "articleM2", title: "Meditation Article 2", imageName: "MeditationLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "stressCat", title: "Stress", imageName: "ReduceStressLogo", content: [
            Content(id: "articleS1", title: "Happiness Article", imageName: "Stress", contentInfo: "This is test content"),
            Content(id: "articleS2", title: "Happiness Article 2", imageName: "Stress", contentInfo: "This is test content")
        ]),
        
        Category(id: "sleepCat", title: "Sleep", imageName: "SleepLogo", content: [
            Content(id: "articleSL1", title: "Sleep Article", imageName: "sleep", contentInfo: "This is test content"),
            Content(id: "articleSL2", title: "Sleep Article 2", imageName: "SleepLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "anxietyCat", title: "Anxiety", imageName: "anxietyLogo", content: [
            Content(id: "articleA1", title: "Anxiety Article", imageName: "contentAnxiety", contentInfo: "This is test content"),
            Content(id: "articleA2", title: "Anxiety Article 2", imageName: "anxietyLogo", contentInfo: "This is test content")
        ]),
        
        Category(id: "yogaCat", title: "Yoga", imageName: "yoga", content: [
            Content(id: "articleY1", title: "Yoga Article", imageName: "yoga", contentInfo: "This is test content"),
            Content(id: "articleY2", title: "Yoga Article 2", imageName: "contentyoga", contentInfo: "This is test content")
        ])
    ]
}
