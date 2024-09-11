//
//  StorageManager.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 11.09.2024.
//

import FirebaseStorage
import Foundation

class StorageManager {
    static let shared = StorageManager()
    private let storage = Storage.storage().reference()

    func uploadProfileImage(with id: String, image: Data, metadata: StorageMetadata) async throws -> StorageMetadata {
        let storageRef = storage.child("images/\(id).jpg")
        return try await storageRef.putDataAsync(image, metadata: metadata)
    }

    func getDownloadUrl(for id: String?) async throws -> URL {
        guard let id = id else {
            throw NSError(domain: "Invalid image id", code: 0, userInfo: nil)
        }
        let storageRef = storage.child(id)
        return try await storageRef.downloadURL()
    }
}
