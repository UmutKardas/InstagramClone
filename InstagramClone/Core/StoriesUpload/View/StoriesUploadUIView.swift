//
//  StoriesUploadUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 11.09.2024.
//

import PhotosUI
import SDWebImageSwiftUI
import SwiftUI

struct StoriesUploadUIView: View {
    @StateObject private var viewModel = StoriesUploadViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var isPresented = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    ZStack {
                        if let image = viewModel.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.3)
                                .clipped()
                        } else {
                            Color.black
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.3)
                        }

                        HStack(spacing: 8) {
                            StoriesUploadTopButtonUIView(image: Image(systemName: "chevron.left"), action: { dismiss() })

                            Spacer()

                            StoriesUploadTopButtonUIView(image: Image(systemName: "textformat"), action: {})
                            StoriesUploadTopButtonUIView(image: Image("UnionIcon"), action: {})
                            StoriesUploadTopButtonUIView(image: Image("FiltersIcon"), action: {})
                            StoriesUploadTopButtonUIView(image: Image("MusicIcon"), action: {})
                            StoriesUploadTopButtonUIView(image: Image(systemName: "ellipsis"), action: {})
                        }
                        .frame(maxHeight: UIScreen.main.bounds.height / 1.3, alignment: .top)
                        .padding(.top, 15)
                        .padding(.horizontal, 15)
                    }

                    HStack(spacing: 8) {
                        StoriesUploadBottomButtonUIView(imageName: "person.circle.fill", title: "Your Story", imageColor: .white)
                        StoriesUploadBottomButtonUIView(imageName: "smallcircle.filled.circle.fill", title: "Close Friends", imageColor: .green)

                        Button {
                            Task {
                                await viewModel.uploadStory()
                            }
                            dismiss()
                        } label: {
                            Image("arrow-right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .photosPicker(isPresented: $isPresented, selection: $viewModel.selectedItem)
            .onAppear { isPresented.toggle() }
        }
    }
}

#Preview {
    StoriesUploadUIView()
}
