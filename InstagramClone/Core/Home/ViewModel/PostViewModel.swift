//
//  PostViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 28.08.2024.
//

import FirebaseAuth
import Foundation

final class PostViewModel: ObservableObject {
    @Published var posts: Post? {
        didSet {
            Task {
                await fetchUser()
            }
        }
    }

    @Published var user: AppUser?

    func fetchUser() async {
        guard let id = posts?.userId else { return }
        let fetchedUser = try? await DatabaseManager.shared.getUser(get: id)
        DispatchQueue.main.async {
            self.user = fetchedUser
        }
    }
}
