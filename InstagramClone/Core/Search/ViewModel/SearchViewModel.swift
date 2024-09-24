//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 19.09.2024.
//

import FirebaseAuth
import SwiftUI

final class SearchViewModel: ObservableObject {
    @Published var user: AppUser?
    @Published var timeLinePosts: [Post]?
    @Published var users: [AppUser] = []
    @Published var textField: String = ""

    init() {
        Task {
            await fetchUser()
            await fetchTimeLinePost()
        }
    }

    private func fetchUser() async {
        guard let id = Auth.auth().currentUser?.uid else { return }

        do {
            let fetchUser = try await DatabaseManager.shared.getUser(get: id)
            DispatchQueue.main.async {
                self.user = fetchUser
            }
        }
        catch {
            print("Failed to fetch user: \(error.localizedDescription)")
        }
    }

    private func fetchTimeLinePost() async {
        do {
            let fetchPosts = try await DatabaseManager.shared.getAllPosts()
            DispatchQueue.main.async {
                self.timeLinePosts = fetchPosts
            }
        }
        catch {
            print("Failed to fetch time line posts: \(error.localizedDescription)")
        }
    }

    func searchUsers() async {
        do {
            let searchResults = try await DatabaseManager.shared.searchUser(query: textField)
            DispatchQueue.main.async {
                self.users = searchResults
            }
        }
        catch {
            print("Failed to search users: \(error.localizedDescription)")
        }
    }
}
