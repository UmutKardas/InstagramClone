//
//  StoryViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 28.08.2024.
//

import FirebaseAuth
import Foundation

final class StoryViewModel: ObservableObject {
    @Published var story: Story? {
        didSet {
            Task {
                await fetchUser()
            }
        }
    }

    @Published var user: AppUser?

    func fetchUser() async {
        guard let id = story?.userId ?? Auth.auth().currentUser?.uid else { return }

        user = try? await DatabaseManager.shared.collectionsUsers(get: id)
    }
}
