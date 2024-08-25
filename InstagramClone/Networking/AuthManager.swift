//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 25.08.2024.
//

import FirebaseAuth
import Foundation

final class AuthManager: AuthServiceProtocol {
    static let shared = AuthManager()
    private let service = Auth.auth()
    @Published private(set) var userSession: FirebaseAuth.User?

    private init() {
        self.userSession = Auth.auth().currentUser
    }

    func login(withEmail email: String, password: String) async throws {
        let result = try await service.signIn(withEmail: email, password: password)
        userSession = result.user
    }

    func register(withEmail email: String, password: String) async throws {
        let result = try await service.createUser(withEmail: email, password: password)
        userSession = result.user
    }

    func logout() throws {
        try service.signOut()
        userSession = nil
    }
}
