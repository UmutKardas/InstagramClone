//
//  PostCellUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct PostCellUIView: View {
    var body: some View {
        VStack {
            // Profile - Username
            HStack {
                Color.gray
                    .frame(width: 40, height: 40)
                    .scaledToFill()
                    .clipShape(Circle())

                Text("umtkardas")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundStyle(Color(.buttonText))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)

            // Image
            Color.gray
                .frame(height: 400)
                .scaledToFill()
                .clipShape(Rectangle())

            // Like - Comment - Share
            HStack(spacing: 15) {
                PostActionUIView(imageName: "heart", value: 12333) {
                    print("Clicked Like")
                }
                PostActionUIView(imageName: "bubble.right", value: 423) {
                    print("Clicked Comment")
                }
                PostActionUIView(imageName: "paperplane", value: 24) {
                    print("Clicked Share")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)

            // Username - Description
            HStack {
                Text("umtkardas")
                    .fontWeight(.semibold)
                    .font(.headline)
                Text("I am an iOS developer")
                    .font(.body)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .padding(.vertical, 1)

            // Date
            Text("5h ago")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.vertical, 1)
        }
    }
}

#Preview {
    PostCellUIView()
}
