//
//  HomeViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 27.08.2024.
//

import FirebaseAuth
import Foundation

final class HomeViewModel: ObservableObject {
    @Published var user: AppUser? {
        didSet {
            Task {
                await getPosts()
                await getStories()
            }
        }
    }

    @Published var posts: [Post]?
    @Published var stories: [Story]?

    init() {
        Task {
            await getUser()
        }
    }

    func getUser() async {
        do {
            guard let id = Auth.auth().currentUser?.uid else { return }
            user = try await DatabaseManager.shared.getUser(get: id)
        } catch {
            print(error.localizedDescription)
        }
    }

    func getPosts() async {
        guard let user = user else { return }
        let userIds = user.following + [user.id]
        do {
            let fetchedPosts = try await DatabaseManager.shared.getUserPosts(userIds: userIds)
            DispatchQueue.main.async {
                self.posts = fetchedPosts
            }
        } catch {
            print("Failed to fetch posts: \(error.localizedDescription)")
        }
    }

    func getStories() async {
        guard let user = user else { return }
        let userIds = user.following + [user.id]
        do {
            let fetchedStories = try await DatabaseManager.shared.getUserStories(userIds: userIds)
            DispatchQueue.main.async {
                self.stories = fetchedStories
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
