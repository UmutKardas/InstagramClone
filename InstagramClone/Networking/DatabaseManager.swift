//
//  DatabaseManager.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 25.08.2024.
//

import FirebaseFirestore
import Foundation

class DatabaseManager {
    static let shared = DatabaseManager()
    private let service = Firestore.firestore()

    func collectionUsers(add id: String, email: String, username: String) async throws {
        let user = AppUser(id: id, username: username, email: email)

        let encodedUser: [String: Any]
        do {
            encodedUser = try Firestore.Encoder().encode(user)
        } catch {
            throw NSError(domain: "FirestoreEncodingError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to encode user data"])
        }

        do {
            try await service.collection(DatabaseConstants.COLLECTION_USERS).document(id).setData(encodedUser)
        } catch {
            throw NSError(domain: "FirestoreDataError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Failed to set user data in Firestore"])
        }
    }

    func collectionUsers(update id: String, updateFields: [String: Any]) async throws {
        do {
            try await service.collection(DatabaseConstants.COLLECTION_USERS).document(id).updateData(updateFields)
        } catch {
            throw NSError(domain: "FirestoreDataError", code: 3, userInfo: [NSLocalizedDescriptionKey: "Failed to update user data in Firestore"])
        }
    }

    func collectionsUsers(get id: String) async throws -> AppUser? {
        return try await service.collection(DatabaseConstants.COLLECTION_USERS).document(id).getDocument().data(as: AppUser.self)
    }

    func collectionsStories(get id: String) async throws -> Story? {
        return try await service.collection(DatabaseConstants.COLLECTION_STORIES).document(id).getDocument().data(as: Story.self)
    }

    func collectionsPosts(get id: String) async throws -> Post? {
        return try await service.collection(DatabaseConstants.COLLECTION_POSTS).document(id).getDocument().data(as: Post.self)
    }

    func collectionsPost(upload post: Post) async throws {
        let encodedPost: [String: Any]
        do {
            encodedPost = try Firestore.Encoder().encode(post)
        } catch {
            throw NSError(domain: "FirestoreEncodingError", code: 4, userInfo: [NSLocalizedDescriptionKey: "Failed to encode post data"])
        }

        do {
            try await service.collection(DatabaseConstants.COLLECTION_POSTS).document(post.id).setData(encodedPost)
        } catch let firestoreError as NSError {
            throw NSError(domain: "FirestoreDataError", code: firestoreError.code, userInfo: [NSLocalizedDescriptionKey: firestoreError.localizedDescription])
        }
    }
}
