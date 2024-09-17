//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 16.09.2024.
//

import FirebaseAuth
import Foundation

final class ProfileViewModel: ObservableObject {
    @Published var user: AppUser? {
        didSet {
            Task {
                await fetchUserPosts(from: self.user)
            }
        }
    }

    @Published var posts: [Post]?

    func fetchUser(id userId: String?) async {
        guard let id = userId else { return }
        do {
            let fetchUser = try await DatabaseManager.shared.getUser(get: id)
            DispatchQueue.main.async {
                self.user = fetchUser
            }
        } catch {
            print("Failed to fetch user: \(error.localizedDescription)")
        }
    }

    func fetchUserPosts(from user: AppUser?) async {
        guard let user = user else { return }
        do {
            let fetchPosts = try await DatabaseManager.shared.getUserPosts(userIds: [user.id])
            DispatchQueue.main.async {
                self.posts = fetchPosts
            }
        } catch {
            print("Failed to fetch posts : \(error.localizedDescription)")
        }
    }

    func toggleFollowStatus() async {
        guard let user = user, let currentId = Auth.auth().currentUser?.uid else { return }
        do {
            let updateFields = ["followers": isCurrentUserFollowing() ? user.followers.filter { $0 != currentId } : user.followers + [currentId]]
            try await DatabaseManager.shared.updateUser(id: user.id, updateFields: updateFields)
        } catch {
            print("Failed to follow user \(error.localizedDescription) ")
        }
    }

    func isCurrentUserFollowing() -> Bool {
        guard let user = user, let currentId = Auth.auth().currentUser?.uid else { return false }
        return user.followers.contains(currentId)
    }
}
