//
//  ReelsViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 24.09.2024.
//

import FirebaseAuth
import Foundation

final class ReelsViewModel: ObservableObject {
    @Published var user: AppUser?

    init() {
        Task {
            await fetchUser()
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
}
