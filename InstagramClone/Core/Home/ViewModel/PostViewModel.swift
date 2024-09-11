//
//  PostViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 28.08.2024.
//

import Foundation

final class PostViewModel: ObservableObject {
    @Published var posts: Post? {
        didSet { Task {
            await fetchUser()
        } }
    }

    @Published var user: AppUser?

    func fetchUser() async {
        guard let id = posts?.userId else { return }
        user = try? await DatabaseManager.shared.collectionsUsers(get: id)
    }
}
