//
//  LoginUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 22.08.2024.
//

import SwiftUI

struct LoginUIView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var isPresentAlert = false

    var body: some View {
        NavigationStack {
            Spacer()

            Image("instagramLogo")
                .resizable()
                .scaledToFill()
                .frame(width: 220, height: 100)

            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .font(.subheadline)
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .autocapitalization(.none)
                    .keyboardType(.default)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)

                SecureField("Enter your password", text: $viewModel.password)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .font(.subheadline)
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
            }

            Button {
                Task {
                    await viewModel.login()
                    DispatchQueue.main.async {
                        if !viewModel.error.isEmpty {
                            isPresentAlert.toggle()
                        }
                    }
                }
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
            .padding(.horizontal, 24)

            Button {
                print("Forget Password?")
            } label: {
                Text("Forget Password?")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 24)
                    .padding(.top, 10)
            }

            HStack {
                Rectangle()
                    .frame(height: 0.5)
                Text("OR")
                Rectangle()
                    .frame(height: 0.5)
            }
            .padding(.horizontal, 24)
            .foregroundStyle(Color.gray)

            HStack {
                Image("facebookIcon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)

                Text("Continue with Facebook")
                    .font(.footnote)
                    .foregroundStyle(Color(.systemBlue))
                    .fontWeight(.semibold)
            }
            .padding(.top, 10)

            Spacer()
            Divider()
            NavigationLink {
                AddYourEmailUIView()
                    .navigationBarBackButtonHidden(true)
                    .environmentObject(RegisterViewModel())

            } label: {
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(Color(.systemBlue))

                    Text("Sign Up")
                        .foregroundStyle(Color(.systemBlue))
                        .fontWeight(.semibold)
                }
            }.padding(.bottom, 20)
                .alert(isPresented: $isPresentAlert, content: {
                    Alert(title: Text("Error"), message: Text(viewModel.error), dismissButton: .default(Text("OK")))
                })
        }
    }
}

#Preview {
    LoginUIView()
}
