//
//  UploadUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import PhotosUI
import SwiftUI

struct UploadUIView: View {
    @State var caption: String = ""
    @State var isPresented: Bool = false
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
                        isPresented.toggle()
                    }

                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.leading, 10)
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: { toolbarContent })
            .onAppear {
                isPresented.toggle()
            }
            .photosPicker(isPresented: $isPresented, selection: $viewModel.selectedItem)
        }
    }

    private var toolbarContent: some ToolbarContent {
        Group {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    viewModel.resetViewModel()
                    caption = ""
                    selectionIndex = 0
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Upload") {
                    print("Upload")
                }
            }
        }
    }
}

#Preview {
    UploadUIView(selectionIndex: Binding.constant(0))
}
