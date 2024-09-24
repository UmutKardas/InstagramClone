//
//  ProfileUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import FirebaseAuth
import SDWebImageSwiftUI
import SwiftUI

struct ProfileUIView: View {
    @StateObject private var viewModel: ProfileViewModel = .init()
    @State private var isEditingProfile: Bool = false
    @State private var profileButtonTitle: String = ""

    var userId: String

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
                        WebImage(url: URL(string: viewModel.user?.profilePictureData ?? "")) { image in
                            image
                                .resizable()
                                .frame(width: 80, height: 80)
                                .scaledToFill()
                                .clipShape(Circle())
                        } placeholder: {
                            Color.gray
                                .frame(width: 80, height: 80)
                                .scaledToFill()
                                .clipShape(Circle())
                        }

                        Spacer()
                        UserStatUIView(value: viewModel.posts?.count ?? 0, title: "Post")
                        UserStatUIView(value: viewModel.user?.followers.count ?? 0, title: "Follower")
                        UserStatUIView(value: viewModel.user?.following.count ?? 0, title: "Following")
                    }.padding(.horizontal)

                    // Username - Description
                    VStack(alignment: .leading, spacing: 2) {
                        Text(viewModel.user?.username ?? "user")
                            .fontWeight(.semibold)
                            .font(.footnote)
                        Text(viewModel.user?.biography ?? "bio")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                    // Editing Profile Button
                    ProfileButtonView(title: $profileButtonTitle, isMyProfile: viewModel.user?.id == Auth.auth().currentUser?.uid) {
                        isEditingProfile.toggle()
                    }
                    onFollow: {
                        Task {
                            await viewModel.toggleFollowStatus()
                            updateProfileButtonTitle()
                        }
                    }

                    Divider()

                    // Posts
                    LazyVGrid(columns: gridItems, spacing: 1, content: {
                        ForEach(viewModel.posts ?? []) { post in
                            WebImage(url: URL(string: post.imageData)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width / 3 - 2, height: UIScreen.main.bounds.width / 3 - 2)
                                    .clipped()
                            } placeholder: {
                                Color(.gray)
                                    .frame(width: 100, height: 100)
                                    .scaledToFill()
                            }
                        }
                    }).padding(.horizontal, 5)
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationDestination(isPresented: $isEditingProfile) {
                EditProfileUIView()
                    .navigationBarBackButtonHidden(true)
            }
        }
        .onAppear {
            Task {
                if !userId.isEmpty {
                    await viewModel.fetchUser(id: self.userId)
                    DispatchQueue.main.async {
                        updateProfileButtonTitle()
                    }
                }
            }
        }
    }

    private func updateProfileButtonTitle() {
        profileButtonTitle = userId == Auth.auth().currentUser?.uid
            ? "Editing Profile"
            : viewModel.isCurrentUserFollowing() ? "Following" : "Follow"
    }
}

#Preview {
    ProfileUIView(userId: Auth.auth().currentUser?.uid ?? "")
}
