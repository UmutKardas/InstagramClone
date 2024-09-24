//
//  StoriesUploadViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 17.09.2024.
//

import FirebaseAuth
import FirebaseStorage
import Foundation
import PhotosUI
import SwiftUI

final class StoriesUploadViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage()
            }
        }
    }

    @Published var imageData: Data?
    @Published var image: Image?

    private func loadImage() async {
        guard let selectedItem = selectedItem, let data = try? await selectedItem.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) else { return }
        imageData = data
        image = Image(uiImage: uiImage)
    }

    func uploadStory() async {
        guard let id = Auth.auth().currentUser?.uid, let imageData = await getUploadImage() else { return }
        let story = Story(id: UUID().uuidString, userId: id, imageData: imageData, date: Date())
        try? await DatabaseManager.shared.uploadStory(story: story)
    }

    func getUploadImage() async -> String? {
        guard let imageData = imageData else { return nil }
        guard let storageMetadata = try? await StorageManager.shared.uploadProfileImage(with: UUID().uuidString, image: imageData, metadata: StorageMetadata()) else { return nil }
        return try? await StorageManager.shared.getDownloadUrl(for: storageMetadata.path).absoluteString
    }
}
