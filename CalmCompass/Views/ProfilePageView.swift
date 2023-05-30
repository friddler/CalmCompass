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
import UIKit

class ProfileImageManager: ObservableObject {
    @Published var selectedImage: UIImage?
}

struct ProfilePageView: View {
    @StateObject private var profileImageManager = ProfileImageManager()
    @State private var isShowingImagePicker = false
    @State private var isEditMode = false
    @State private var editedUsername = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var tabSelected: Tab = .person
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    var body: some View {
        ZStack {
            Image("profilebg2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 20) {
                    ZStack {
                        if let image = profileImageManager.selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                                .offset(y: 40)
                        } else {
                            Button(action: {
                                isShowingImagePicker = true
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                    .offset(x: 5, y: 20)
                            }
                        }
                        
                        if let _ = profileImageManager.selectedImage {
                            Button(action: {
                                isShowingImagePicker = true
                            }) {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .offset(x: 5, y: -20)
                            }
                        }
                    }
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: {
                                fetchProfileImage()
                                saveProfileImage()  // Call saveProfileImage() when the image selection is dismissed
                            }) {
                                ImagePicker(selectedImage: $profileImageManager.selectedImage, onImageSelected: {
                                    // Optional: You can perform any additional actions after an image is selected
                                    // saveProfileImage()  // You can call saveProfileImage() here as well if needed
                                })
                            }
                    
                    if isEditMode {
                        TextField("Username", text: $editedUsername)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: 145, y: 40)
                    } else {
                        Text(username)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .offset(y: 30)
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
                                .font(.system(size: 24))) {
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
            .overlay(Navigation_bar_View(selectedTab: $tabSelected))
            
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
                
                // Fetch and display the profile image
                fetchProfileImage()
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func fetchProfileImage() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User is not authenticated.")
            return
        }
        
        let storageRef = storage.reference()
        let imageRef = storageRef.child("profile_images/\(uid).jpg")
        
        // Create a temporary URL for writing the image data
        let tempURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(uid)
        
        imageRef.write(toFile: tempURL) { url, error in
            if let error = error {
                print("Error downloading profile image: \(error.localizedDescription)")
            } else if let localURL = url, let imageData = try? Data(contentsOf: localURL), let image = UIImage(data: imageData) {
                // Set the downloaded image to the profileImageManager
                profileImageManager.selectedImage = image
            }
        }
    }
    
    func saveProfileImage() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User is not authenticated.")
            return
        }
        
        guard let image = profileImageManager.selectedImage else {
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert image to data.")
            return
        }
        
        let storageRef = storage.reference()
        let imageRef = storageRef.child("profile_images/\(uid).jpg")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        imageRef.putData(imageData, metadata: metadata) { (metadata, error) in
            if let error = error {
                print("Error uploading profile image: \(error.localizedDescription)")
            } else {
                // Profile image uploaded successfully. Update the profile image URL in the Firestore database.
                imageRef.downloadURL { (url, error) in
                    if let error = error {
                        print("Error retrieving profile image URL: \(error.localizedDescription)")
                    } else if let downloadURL = url {
                        let profileImageURL = downloadURL.absoluteString
                        db.collection("users").document(uid).updateData(["profileImageURL": profileImageURL]) { error in
                            if let error = error {
                                print("Error updating profile image URL: \(error.localizedDescription)")
                            } else {
                                print("Profile image URL updated successfully.")
                                
                                // Update the profileImageManager with the new image
                                profileImageManager.selectedImage = image
                            }
                        }
                    }
                }
            }
        }
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

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var onImageSelected: (() -> Void)?
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No update needed
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                if let selectedImage = info[.originalImage] as? UIImage {
                    parent.selectedImage = selectedImage
                    parent.onImageSelected?()  // Call the closure to trigger image saving
                }
                picker.dismiss(animated: true)
            }
        }
    }
}

struct ProfilePageView_Previews: PreviewProvider {
static var previews: some View {
ProfilePageView()
  }
}
