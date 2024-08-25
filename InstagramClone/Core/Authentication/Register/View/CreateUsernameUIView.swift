//
//  CreateUsernameUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 22.08.2024.
//

import SwiftUI

struct CreateUsernameUIView: View {
    @EnvironmentObject var viewModel: RegisterViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                Text("Add your username")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.buttonText)
                    .padding(.top)

                Text("You'll use this username to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)

                TextField("Enter your username", text: $viewModel.username)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .font(.subheadline)
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .autocapitalization(.none)

                NavigationLink {
                    CreatePasswordUIView()
                        .environmentObject(viewModel)

                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.buttonText)
                        .frame(width: 340, height: 45)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6, style: .circular)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }
            }
        }
    }
}

#Preview {
    CreateUsernameUIView()
        .environmentObject(RegisterViewModel())
}
