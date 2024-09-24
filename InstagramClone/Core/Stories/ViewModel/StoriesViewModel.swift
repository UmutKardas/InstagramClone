//
//  StoriesViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 17.09.2024.
//

import FirebaseAuth
import Foundation
import SwiftUI

final class StoriesViewModel: ObservableObject {
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

    @Published var dismiss: (() -> ())?
    private var timer: Timer?

    func fetchUser() async {
        guard let id = story?.userId ?? Auth.auth().currentUser?.uid else { return }
        let fetchUser = try? await DatabaseManager.shared.getUser(get: id)
        DispatchQueue.main.async {
            self.user = fetchUser
        }
    }

    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.progress < 1 {
                self.progress += CGFloat(0.01 / 5)
            } else {
                self.stopTimer()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        dismiss?()
    }
}
