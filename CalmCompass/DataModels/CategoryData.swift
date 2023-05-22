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
            ArticleContent(id: "articleH1", title: "The path to happiness", imageName: "HapinessLogo", contentInfo: "Happiness is a state of mind that brings joy, contentment, and fulfillment. It is not something we stumble upon but rather a choice we make each day. Embracing happiness is essential for our overall well-being and can have a profound impact on our lives. Finding happiness begins with cultivating a positive mindset. It involves focusing on the present moment and appreciating the simple pleasures life offers. Whether it's savoring a delicious meal, spending quality time with loved ones, or enjoying a beautiful sunset, happiness can be found in the little things. \n\nPracticing gratitude is another powerful way to invite happiness into our lives. Taking a few moments each day to reflect on the things we are grateful for can shift our perspective and bring a sense of contentment. Gratitude reminds us of the abundance around us and helps us appreciate the blessings in our lives. Engaging in activities that bring us joy and fulfillment is also key to experiencing happiness. Whether it's pursuing a hobby, engaging in creative outlets, or participating in physical exercise, doing what we love boosts our mood and enhances our overall well-being.\n\nIt's important to remember that happiness is a journey, not a destination. It's not about constant euphoria but rather a sense of inner peace and satisfaction. Embracing both positive and negative experiences, learning from challenges, and focusing on personal growth contribute to long-lasting happiness. In conclusion, happiness is within our reach. By choosing to adopt a positive mindset, practicing gratitude, and engaging in activities that bring us joy, we can cultivate happiness in our everyday lives. Embrace the power of positivity and embark on a journey of happiness that will enrich your life and the lives of those around you."),
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

