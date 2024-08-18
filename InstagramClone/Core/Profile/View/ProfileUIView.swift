//
//  ProfileUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct ProfileUIView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Image - User Stat
                    HStack(spacing: 3) {
                        Color.gray
                            .frame(width: 80, height: 80)
                            .scaledToFill()
                            .clipShape(Circle())
                        Spacer()
                        UserStatUIView(value: 6, title: "Post")
                        UserStatUIView(value: 122, title: "Follower")
                        UserStatUIView(value: 121, title: "Following")
                    }.padding(.horizontal)

                    // Username - Description
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Umut Kardas")
                            .fontWeight(.semibold)
                            .font(.footnote)
                        Text("I`am a iOS developer.")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                    // Editing Profile Button
                    Button {
                        print("Clicked Editing Profile Button")
                    } label: {
                        Text("Editing Profile")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .foregroundStyle(Color(.buttonText))
                            .frame(width: 350, height: 30)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                    }
                    Divider()

                    // Posts
                    LazyVGrid(columns: gridItems, spacing: 1, content: {
                        ForEach(0 ... 2, id: \.self) { _ in
                            Color(.gray)
                                .scaledToFill()
                        }
                    })
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ProfileUIView()
}
