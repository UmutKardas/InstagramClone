//
//  StoryViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 28.08.2024.
//

import FirebaseAuth
import Foundation
import SwiftUI

final class StoryViewModel: ObservableObject {
    @Published var story: Story? {
        didSet {
            Task {
                await fetchUser()
            }
        }
    }

    @Published var user: AppUser?
    @Published var image: Image?
    @Published var caption: String = ""
    @Published var progress: CGFloat = 0
    private var timer: Timer?

    func fetchUser() async {
        guard let id = story?.userId ?? Auth.auth().currentUser?.uid else { return }
        let fetchUser = try? await DatabaseManager.shared.getUser(get: id)
        DispatchQueue.main.async {
            self.user = fetchUser
        }
    }
}
