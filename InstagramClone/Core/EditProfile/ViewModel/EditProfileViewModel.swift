//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 16.09.2024.
//

import FirebaseAuth
import FirebaseStorage
import Foundation
import PhotosUI
import SwiftUI

final class EditProfileViewModel: ObservableObject {
    @Published var user: AppUser?
    @Published var nameTextField: String = ""
    @Published var biographyTextField: String = ""
    @Published var selectedPickerItem: PhotosPickerItem? {
        didSet {
            Task {
                await loadItem(from: selectedPickerItem)
            }
        }
    }

    @Published var imageData: Data?
    @Published var selectedImage: Image?

    private func loadItem(from item: PhotosPickerItem?) async {
        guard let item = item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data) else { return }
        imageData = data
        selectedImage = Image(uiImage: uiImage)
    }

    func updateProfile() async {
        guard let id = Auth.auth().currentUser?.uid else { return }
        var updateFields: [String: Any] = [:]

        if let imageData = await getUploadImage() {
            updateFields["profilePictureData"] = imageData
        }

        if !nameTextField.isEmpty {
            updateFields["username"] = nameTextField
        }

        if !biographyTextField.isEmpty {
            updateFields["biography"] = biographyTextField
        }

        await try? DatabaseManager.shared.updateUser(id: id, updateFields: updateFields)
    }

    func getUploadImage() async -> String? {
        guard let imageData = imageData else { return nil }
        guard let storageMetadata = try? await StorageManager.shared.uploadProfileImage(with: UUID().uuidString, image: imageData, metadata: StorageMetadata()) else { return nil }
        return try? await StorageManager.shared.getDownloadUrl(for: storageMetadata.path).absoluteString
    }
}
