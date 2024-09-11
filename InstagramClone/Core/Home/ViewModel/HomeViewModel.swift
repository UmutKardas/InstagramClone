//
//  HomeViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 27.08.2024.
//

import FirebaseAuth
import Foundation

final class HomeViewModel: ObservableObject {
    @Published var user: AppUser?
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
            user = try await DatabaseManager.shared.collectionsUsers(get: id)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
