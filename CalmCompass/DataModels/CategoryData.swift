//
//  Category.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-16.
//

import Foundation

struct Category {
    let id: String
    let title: String
    let imageName: String
    var articleContent: [ArticleContent]
    var musicContent: [MusicContent]
    var exerciseContent: [ExerciseContent]
    
    
    static var categories: [Category] = [
        
        Category(id: "1", title: "Happiness", imageName: "HapinessLogo", articleContent: [
            ArticleContent(id: "articleH1", title: "Happiness Article 1", imageName: "HapinessLogo", contentInfo: "This is test content happy 1"),
            ArticleContent(id: "articleH2", title: "Happiness Article 2", imageName: "HapinessLogo", contentInfo: "This is test content 2 happy "),
            ArticleContent(id: "articleH3", title: "Happiness Article 3", imageName: "HapinessLogo", contentInfo: "This is test content 3 happy ")
        ], musicContent: [
            MusicContent(id: "musicH1", title: "Music content", imageName: "hapinessLogo", contentInfo: "This is music test 1 happy", musicFile: "musicH1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseH1", title: "Exercise content", imageName: "hapinessLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseH1"))
        ]),
        
        Category(id: "2", title: "Meditation", imageName: "MeditationLogo", articleContent: [
            ArticleContent(id: "articleM1", title: "Meditation article 1", imageName: "MeditationLogo", contentInfo: "This is test content meditation 1"),
            ArticleContent(id: "articleM2", title: "Meditation article 2", imageName: "MeditationLogo", contentInfo: "This is test content meditation 2")
        ], musicContent: [
            MusicContent(id: "musicM1", title: "Music content meditation", imageName: "MeditationLogo", contentInfo: "This is music test 1 meditation", musicFile: "musicM1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseM1", title: "Exercise content meditation", imageName: "MeditationLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseM1"))
        ]),
        
        Category(id: "3", title: "Stress", imageName: "ReduceStressLogo", articleContent: [
            ArticleContent(id: "articleS1", title: "Stress article 1", imageName: "ReduceStressLogo", contentInfo: "This is test content Stress 1"),
            ArticleContent(id: "articleS2", title: "Stress article 2", imageName: "ReduceStressLogo", contentInfo: "This is test content Stress 2")
        ], musicContent: [
            MusicContent(id: "musicS1", title: "Music content Stress", imageName: "ReduceStressLogo", contentInfo: "This is music test 1 Stress", musicFile: "musicS1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseS1", title: "Exercise content Stress", imageName: "ReduceStressLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseS1"))
        ]),
        
        Category(id: "4", title: "Sleep", imageName: "SleepLogo", articleContent: [
            ArticleContent(id: "articleSL1", title: "Sleep article 1", imageName: "SleepLogo", contentInfo: "This is test content Sleep 1"),
            ArticleContent(id: "articleSL2", title: "Sleep article 2", imageName: "SleepLogo", contentInfo: "This is test content Sleep 2")
        ], musicContent: [
            MusicContent(id: "musicSL1", title: "Music content Sleep", imageName: "SleepLogo", contentInfo: "This is music test Sleep 1", musicFile: "musicSL1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseSL1", title: "Exercise content Sleep", imageName: "SleepLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseSL1"))
        ]),
        
        Category(id: "5", title: "Anxiety", imageName: "anxietyLogo", articleContent: [
            ArticleContent(id: "articleA1", title: "Anxiety article 1", imageName: "anxietyLogo", contentInfo: "This is test content anxiety 1"),
            ArticleContent(id: "articleA2", title: "Anxiety article 2", imageName: "anxietyLogo", contentInfo: "This is test content anxiety 2")
        ], musicContent: [
            MusicContent(id: "musicA1", title: "Music content anxiety", imageName: "anxietyLogo", contentInfo: "This is music test 1 anxiety", musicFile: "musicA1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseA1", title: "Exercise content anxiety", imageName: "anxietyLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseA1"))
        ]),
        
        Category(id: "6", title: "Yoga", imageName: "yoga", articleContent: [
            ArticleContent(id: "articleY1", title: "Yoga article 1", imageName: "yoga", contentInfo: "This is test content yoga 1"),
            ArticleContent(id: "articleY2", title: "Yoga article 2", imageName: "yoga", contentInfo: "This is test content yoga 2")
        ], musicContent: [
            MusicContent(id: "musicY1", title: "Music content yoga", imageName: "yoga", contentInfo: "This is music test 1 yoga", musicFile: "musicY1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseY1", title: "Exercise content yoga", imageName: "yoga", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseY1"))
        ])
    ]
}

