//
//  Content.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-17.
//

import Foundation

/*
 THe protocol defines a set of properties that all content types must have.
 The 'get' ensures that any type that follows to the protocol must have a way to access the values.
 But they can't be modified.
 */

protocol Content {
    var id: String { get }
    var title: String { get }
    var imageName: String { get }
    var contentInfo: String { get }
}

struct ArticleContent : Content {
    let id: String
    let title: String
    let imageName: String
    let contentInfo: String
    
}

struct MusicContent : Content {
    let id: String
    let title: String
    let imageName: String
    let contentInfo: String
    let duration : TimeInterval
    let musicFile: String
    
}

struct ExerciseContent : Content {
    
    let id: String
    let title: String
    let imageName: String
    let contentInfo: String
    let videoURL: String
    
}
 

