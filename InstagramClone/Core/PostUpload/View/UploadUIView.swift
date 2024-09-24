//
//  UploadUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import PhotosUI
import SwiftUI

struct UploadUIView: View {
    @Binding var selectionIndex: Int
    @StateObject var viewModel: UploadViewModel = .init()

    var body: some View {
        NavigationStack {
            HStack {
                (viewModel.image ?? Image(systemName: "photo.badge.plus"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Rectangle())
                    .onTapGesture {
                        viewModel.isPresented.toggle()
                    }

                TextField("Enter your caption...", text: $viewModel.caption, axis: .vertical)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.leading, 10)
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                UploadToolBar {
                    dismiss()
                } uploadAction: {
                    Task {
                        await viewModel.uploadPost()
                    }
                    dismiss()
                }

            })
            .onAppear {
                viewModel.isPresented.toggle()
            }
            .photosPicker(isPresented: $viewModel.isPresented, selection: $viewModel.selectedItem)
        }
    }

    private func dismiss() {
        viewModel.resetViewModel()
        viewModel.caption = ""
        selectionIndex = 0
    }
}

#Preview {
    UploadUIView(selectionIndex: Binding.constant(0))
}
