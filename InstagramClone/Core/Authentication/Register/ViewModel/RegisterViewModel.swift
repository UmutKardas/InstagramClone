//
//  RegisterViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 25.08.2024.
//

import FirebaseAuth
import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var error: String = ""

    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol = AuthManager.shared) {
        self.authService = authService
    }

    func register() async {
        guard validateInputs() else { return }

        do {
            try await authService.register(withEmail: email, password: password)
            if Auth.auth().currentUser != nil {
                await saveUser()
            }
        } catch {
            self.error = "An unexpected error occurred. Please try again."
        }
    }

    func saveUser() async {
        do {
            try await DatabaseManager.shared.addUser(add: Auth.auth().currentUser!.uid, email: email, username: username)
        } catch {
            self.error = "An unexpected error occurred. Please try again."
        }
    }

    private func validateInputs() -> Bool {
        if email.isEmpty {
            error = "Email cannot be empty."
            return false
        }

        if password.isEmpty {
            error = "Password cannot be empty."
            return false
        }

        if !email.contains("@") {
            error = "Please enter a valid email address."
            return false
        }

        return true
    }
}
