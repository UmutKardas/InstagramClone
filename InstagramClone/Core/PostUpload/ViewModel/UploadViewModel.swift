//
//  UploadViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 19.08.2024.
//

import FirebaseAuth
import FirebaseStorage
import Foundation
import PhotosUI
import SwiftUI

class UploadViewModel: ObservableObject {
    @Published var image: Image?
    @Published var imageData: Data?
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadItem(from: selectedItem) } }
    }
    
    private func loadItem(from item: PhotosPickerItem?) async {
        guard let item = item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data) else { return }
        imageData = uiImage.jpegData(compressionQuality: 0.5)
        image = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async {
        guard let data = await getUploadImage(), let userId = Auth.auth().currentUser?.uid else { return }
        
        let post = Post(
            id: UUID().uuidString,
            userId: userId,
            caption: caption,
            likes: [],
            shares: [],
            imageData: data,
            comments: [:],
            createdDate: Date()
        )
        
        do {
            try await DatabaseManager.shared.collectionsPost(upload: post)
        } catch {
            print("Error uploading post: \(error.localizedDescription)")
        }
    }
    
    func getUploadImage() async -> String? {
        guard let imageData = imageData else { return nil }
        let metadata = try? await StorageManager.shared.uploadProfileImage(with: UUID().uuidString, image: imageData, metadata: StorageMetadata())
        return try? await StorageManager.shared.getDownloadUrl(for: metadata?.path).absoluteString
    }
    
    func resetViewModel() {
        image = nil
        selectedItem = nil
    }
}
