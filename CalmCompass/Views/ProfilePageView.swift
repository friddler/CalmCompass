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
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var selectedTab: Tab = .person
    
    let db = Firestore.firestore()
    
    var body: some View {
        ZStack {
            Image("profilebg2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 20) {
                    ZStack {
                        Image("profiletests")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .offset(y: 40)
                          
                        
                        Button(action: {
                            fetchProfileImage()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.white)
                                .offset(x: 45, y: 85)
                        }
                    }
                    
                    if isEditMode {
                        TextField("Username", text: $editedUsername)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: 145, y: 35)
                    } else {
                        Text(username)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    VStack {
                        Form {
                            Section(header: Image(systemName: "person")
                                .foregroundColor(.white)
                                            .font(.system(size: 24))) {
                                
                                Text(username)
                            }
                            Section(header: Image(systemName: "envelope")
                                .foregroundColor(.white)
                                            .font(.system(size: 24))) { // Increase the font size here
                                Text(email)
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                
                    
                    
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
                            .background(Color.cyan)
                            .cornerRadius(20)
                    }
                    
                    Spacer().frame(height: 100)
                }
            }
            .overlay(Navigation_bar_View(selectedTab: $selectedTab))
        }
        .onAppear {
            fetchUserData()
        }
    }
    
    func fetchUserData() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User is not authenticated.")
            return
        }
        
        db.collection("users").document(uid).getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                username = data?["username"] as? String ?? ""
                
                Auth.auth().currentUser?.providerData.forEach { userInfo in
                    if userInfo.providerID == "password" {
                        email = userInfo.email ?? ""
                    }
                }
            } else {
                print("Document does not exist")
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
                  
                  db.collection("users").document(uid).updateData(["username": editedUsername]) { error in
                      if let error = error {
                          print("Error saving username: \(error.localizedDescription)")
                      } else {
                          print("Username saved successfully.")
                          username = editedUsername
                      }
                  }
              }
          }
struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
  }
}
