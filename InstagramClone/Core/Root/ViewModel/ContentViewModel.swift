//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 25.08.2024.
//

import Combine
import FirebaseAuth
import Foundation

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?

    private var subscriptions = Set<AnyCancellable>()

    init() {
        setupSubscriptions()
    }

    private func setupSubscriptions() {
        AuthManager.shared.$userSession.sink(receiveValue: { [weak self] user in
            self?.userSession = user
        })
        .store(in: &subscriptions)
    }
}
