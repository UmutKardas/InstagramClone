//
//  SearchResultUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct SearchResultUIView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        LazyVStack {
            ForEach(viewModel.users) { user in
                NavigationLink {
                    ProfileUIView(userId: user.id)
                } label: {
                    HStack(spacing: 10) {
                        WebImage(url: URL(string: user.profilePictureData)) { image in
                            image
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .scaledToFill()
                        } placeholder: {
                            Color.gray
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .scaledToFill()
                        }

                        Text(user.username)
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 15)
                }
            }
        }
    }
}

#Preview {
    SearchResultUIView(viewModel: SearchViewModel())
}
