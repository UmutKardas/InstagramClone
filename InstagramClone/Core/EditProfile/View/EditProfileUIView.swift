//
//  EditProfileUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 16.09.2024.
//

import PhotosUI
import SwiftUI

struct EditProfileUIView: View {
    @StateObject var viewModel: EditProfileViewModel = .init()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Divider()

                PhotosPicker(selection: $viewModel.selectedPickerItem) {
                    VStack {
                        (viewModel.selectedImage ?? Image(systemName: "person"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                            .foregroundStyle(Color.white)
                            .clipShape(Circle())
                        Text("Edit profile picture")
                            .font(.subheadline)
                    }
                }

                Divider()

                VStack(spacing: 15) {
                    EditProfileRowView(title: "Name", placeholder: "Enter Your Name...", textField: $viewModel.nameTextField)
                    EditProfileRowView(title: "Bio", placeholder: "Enter Your Biography...", textField: $viewModel.biographyTextField)
                }
                .padding(.top, 20)

                Spacer()
            }
            .toolbar(content: {
                EditProfileToolBar {
                    dismiss()
                } uploadAction: {
                    Task {
                        await viewModel.updateProfile()
                    }
                    dismiss()
                }

            })
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditProfileUIView()
}
