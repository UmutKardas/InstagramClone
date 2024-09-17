//
//  PostCellUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct PostCellUIView: View {
    var post: Post?
    @StateObject var viewModel: PostViewModel = .init()

    var body: some View {
        VStack {
            // Profile - Username
            HStack {
                WebImage(url: URL(string: viewModel.user?.profilePictureData ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .clipShape(Circle())

                } placeholder: {
                    Color.gray
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .clipShape(Circle())
                }

                Text(viewModel.user?.username ?? "User")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundStyle(Color(.buttonText))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)

            WebImage(url: URL(string: viewModel.posts?.imageData ?? "")) { image in
                image
                    .resizable()
                    .frame(height: 400)
                    .scaledToFit()
                    .clipShape(Rectangle())

            } placeholder: {
                Color.gray
                    .frame(height: 400)
                    .scaledToFill()
                    .clipShape(Rectangle())
            }

            // Like - Comment - Share
            HStack(spacing: 15) {
                PostActionUIView(imageName: "heart", value: viewModel.posts?.likes.count ?? 0) {
                    print("Clicked Like")
                }
                PostActionUIView(imageName: "bubble.right", value: viewModel.posts?.comments.count ?? 0) {
                    print("Clicked Comment")
                }
                PostActionUIView(imageName: "paperplane", value: viewModel.posts?.shares.count ?? 0) {
                    print("Clicked Share")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)

            // Username - Description
            HStack {
                Text(viewModel.user?.username ?? "User")
                    .fontWeight(.semibold)
                    .font(.headline)
                Text(viewModel.posts?.caption ?? "Description")
                    .font(.body)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .padding(.vertical, 1)

            // Date
            Text(viewModel.posts?.createdDate.formattedDate() ?? "5h ago")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.vertical, 1)
        }
        .onAppear {
            viewModel.posts = self.post
        }
    }
}

#Preview {
    PostCellUIView(post: nil)
}
