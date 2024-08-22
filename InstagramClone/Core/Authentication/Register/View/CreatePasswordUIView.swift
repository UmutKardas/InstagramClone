//
//  CreatePasswordUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 22.08.2024.
//

import SwiftUI

struct CreatePasswordUIView: View {
    @State private var password: String = ""
    @State private var passwordAgain: String = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                Text("Add your password")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.buttonText)
                    .padding(.top)

                Text("You'll use this password to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)

                TextField("Enter your password", text: $password)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .font(.subheadline)
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .autocapitalization(.none)

                TextField("Enter your password Again", text: $passwordAgain)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .font(.subheadline)
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .autocapitalization(.none)

                NavigationLink {
                    SignUpCompleteUIView()
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(isDisabled() ? .gray : .buttonText)
                        .frame(width: 340, height: 45)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6, style: .circular)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }.disabled(isDisabled())
            }
        }
    }

    private func isDisabled() -> Bool {
        return password != passwordAgain || password.isEmpty
    }
}

#Preview {
    CreatePasswordUIView()
}
