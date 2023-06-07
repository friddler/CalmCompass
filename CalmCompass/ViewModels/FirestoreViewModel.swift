//
//  FirestoreViewModel.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-11.
//

import Foundation
import FirebaseFirestore
import Firebase

class FirestoreViewModel : ObservableObject {
    
    private let db = Firestore.firestore()
    @Published var categories: [Category] = []
    
    func fetchCategoriesFromFirestore() {
        
        /* 1. Here we try to retrieve the documents from the categories collection on firestore.
         
           2. If there are any errors it captures the 'self' to avoid crasch.
         
           3. If error occurs it will print a message and return.
         
           4. If there are no errors it will continue and check if the snapshot.documents (snapshot is a representation of the data on firestore),
           if its not nil. if it doesn't have any found documents in the collection. It will then print a message and return.
         
           5. If there are documents in the snapshot it will initialize an empty array and store the categories in it.
         
           6. Then we iterate over each document in a for loop, and for each document we will call the func parseCategoryDocument function,
           and pass the document as a parameter (document: DocumentSnapshot). The function is analysing the category data from the document
           and returns a category object. If the function is successful it reutrns a category object and append it to the array.
         
           7. After looking through all of thhe documents we use the dispatchqueue to update the categories in our application.
           The method ensures that the UI updates asynchronously.
         
         */
        
        db.collection("categories").getDocuments { [self] snapshot, error in
            if let error = error {
                print("Error fetching categories: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }
            
            var fetchedCategories: [Category] = []
            
            for document in documents {
                if let category = parseCategoryDocument(document) {
                    fetchedCategories.append(category)
                }
            }
            
            DispatchQueue.main.async {
                self.categories = fetchedCategories
            }
        }
    }
    
    private func parseCategoryDocument(_ document: DocumentSnapshot) -> Category? {
        
        /*
         This function takes in the documentSnapshot as an argument and tries to analyze it
         to create a category object.
         
         1. It checks if the data fields exist in the document, if some are missing it will return nil.
         
         2. If the fields exists it will initialize empty arrays to store the content data.
         
         3. Then it goes through the arrays looking for articles, music and exercises. for each data item it calls the other functions
         to analyze the individual content.
         
         4. If it's successful, the analyzed content appends to the array.
         
         */
        
        guard let data = document.data(),
              let id = data["id"] as? String,
              let title = data["title"] as? String,
              let imageName = data["imageName"] as? String,
              let categoryImage = data["categoryImage"] as? String,
              let articleContentData = data["articleContent"] as? [[String: Any]],
              let musicContentData = data["musicContent"] as? [[String: Any]],
              let exerciseContentData = data["exerciseContent"] as? [[String: Any]] else {
            return nil
        }
        
        var articleContent: [ArticleContent] = []
        for articleData in articleContentData {
            if let article = parseArticleContent(articleData) {
                articleContent.append(article)
            }
        }
        
        var musicContent: [MusicContent] = []
        for musicData in musicContentData {
            if let music = parseMusicContent(musicData) {
                musicContent.append(music)
            }
        }
        
        var exerciseContent: [ExerciseContent] = []
        for exerciseData in exerciseContentData {
            if let exercise = parseExerciseContent(exerciseData) {
                exerciseContent.append(exercise)
            }
        }
        
        return Category(id: id,
                        title: title,
                        imageName: imageName,
                        categoryImage: categoryImage,
                        articleContent: articleContent,
                        musicContent: musicContent,
                        exerciseContent: exerciseContent)
        
    }
    
    private func parseArticleContent(_ data: [String: Any]) -> ArticleContent? {
        guard let id = data["id"] as? String,
              let title = data["title"] as? String,
              let imageName = data["imageName"] as? String,
              let contentInfo = data["contentInfo"] as? String else {
            return nil
        }
        
        return ArticleContent(id: id,
                              title: title,
                              imageName: imageName,
                              contentInfo: contentInfo)
    }
    
    private func parseMusicContent(_ data: [String: Any]) -> MusicContent? {
        guard let id = data["id"] as? String,
              let title = data["title"] as? String,
              let imageName = data["imageName"] as? String,
              let contentInfo = data["contentInfo"] as? String,
              let duration = data["duration"] as? TimeInterval,
              let musicFile = data["musicFile"] as? String else {
            return nil
        }
        
        return MusicContent(id: id,
                            title: title,
                            imageName: imageName,
                            contentInfo: contentInfo,
                            duration: duration,
                            musicFile: musicFile)
    }
    
    private func parseExerciseContent(_ data: [String: Any]) -> ExerciseContent? {
        guard let id = data["id"] as? String,
              let title = data["title"] as? String,
              let imageName = data["imageName"] as? String,
              let contentInfo = data["contentInfo"] as? String,
              let videoURL = data["videoURL"] as? String else {
            return nil
        }
        
        return ExerciseContent(id: id,
                               title: title,
                               imageName: imageName,
                               contentInfo: contentInfo,
                               videoURL: videoURL)
    }
}

//    func uploadCategoriesToFirestore(categories: [Category]) {
//        for category in categories {
//            var categoryData: [String: Any] = [
//                "id": category.id,
//                "title": category.title,
//                "imageName": category.imageName
//            ]
//
//            var articleContentData: [[String: Any]] = []
//            for articleContent in category.articleContent {
//                let articleContentDict: [String: Any] = [
//                    "id": articleContent.id,
//                    "title": articleContent.title,
//                    "imageName": articleContent.imageName,
//                    "contentInfo": articleContent.contentInfo
//                ]
//                articleContentData.append(articleContentDict)
//            }
//            categoryData["articleContent"] = articleContentData
//
//            var musicContentData: [[String: Any]] = []
//            for musicContent in category.musicContent {
//                let musicContentDict: [String: Any] = [
//                    "id": musicContent.id,
//                    "title": musicContent.title,
//                    "imageName": musicContent.imageName,
//                    "contentInfo": musicContent.contentInfo,
//                    "duration": musicContent.duration,
//                    "musicFile": musicContent.musicFile
//                ]
//                musicContentData.append(musicContentDict)
//            }
//            categoryData["musicContent"] = musicContentData
//
//            var exerciseContentData: [[String: Any]] = []
//            for exerciseContent in category.exerciseContent {
//                let exerciseContentDict: [String: Any] = [
//                    "id": exerciseContent.id,
//                    "title": exerciseContent.title,
//                    "imageName": exerciseContent.imageName,
//                    "contentInfo": exerciseContent.contentInfo,
//                    "videoURL": exerciseContent.videoURL
//                ]
//                exerciseContentData.append(exerciseContentDict)
//            }
//            categoryData["exerciseContent"] = exerciseContentData
//
//            // Upload the category to Firestore
//            db.collection("categories").addDocument(data: categoryData) { error in
//                if let error = error {
//                    print("Error adding document: \(error)")
//                } else {
//                    print("Category added to Firestore")
//                }
//            }
//        }
//    }


