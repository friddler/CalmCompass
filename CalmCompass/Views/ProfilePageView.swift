//
//  ProfilePageView.swift
//  CalmCompass
//
//  Created by Marlon Garcia-Bermejo on 2023-05-17.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import Firebase

struct ProfilePageView: View {
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var isEditMode = false
    @State private var editedUsername = ""
    
    let db = Firestore.firestore()
    
    var body: some View {
        ZStack {
            Image("profilebg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 10) {
                    ZStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                        
                        Button(action: {
                            fetchProfileImage()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .offset(x: 30, y: 30)
                        }
                    }
                    
                    if isEditMode {
                        TextField("Username", text: $editedUsername)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: 142, y: 1)
                    } else {
                        Text(editedUsername)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    Spacer().frame(height: 20)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Image(systemName: "person")
                            Text("Firstname")
                                .foregroundColor(.orange)
                            Text("Lastname")
                                .foregroundColor(.orange)
                        }
                        
                        HStack {
                            Image(systemName: "envelope")
                            Text("username@hotmail.com")
                        }
                    }
                    
                    Spacer().frame(height: 20)
                    
                    Button(action: {
                        isEditMode.toggle()
                        if !isEditMode {
                            saveUsername()
                        }
                    }) {
                        Text(isEditMode ? "Save" : "Edit")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(20)
                        
                    }
                    
                    Spacer().frame(height: 370)
                }
            }
        }
    }
    
        func fetchProfileImage() {
               #if DEBUG
               print("Fetching profile image is not supported in Canvas preview.")
               #else
               let storageRef = Storage.storage().reference()
               let imageRef = storageRef.child("images/profile.png")
               imageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                   if let error = error {
                       // Handle error while fetching image
                       print("Error fetching image: \(error.localizedDescription)")
                   } else {
                       if let imageData = data {
                           selectedImage = UIImage(data: imageData)
                       }
                   }
               }
               #endif
           }
    
    func saveUsername() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User is not authenticated.")
            return
        }
        
        db.collection("userNames").document(uid).setData(["username": editedUsername]) { error in
            if let error = error {
                print("Error saving username: \(error.localizedDescription)")
            } else {
                print("Username saved successfully.")
            }
        }
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
