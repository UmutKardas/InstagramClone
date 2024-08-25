//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 25.08.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: String = ""

    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol = AuthManager.shared) {
        self.authService = authService
    }

    @MainActor
    func login() async {
        guard validateInputs() else { return }

        do {
            try await authService.login(withEmail: email, password: password)
        }
        catch {
            self.error = "An unexpected error occurred. Please try again."
        }
    }

    private func validateInputs() -> Bool {
        error = ""

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
