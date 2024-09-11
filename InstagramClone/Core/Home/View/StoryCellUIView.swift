//
//  StoryCellUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct StoryCellUIView<Destination: View>: View {
    @StateObject var viewModel: StoryViewModel = .init()
    var story: Story?
    var view: Destination

    var body: some View {
        VStack {
            NavigationLink { view } label: {
                WebImage(url: URL(string: viewModel.user?.profilePictureData ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)

                } placeholder: {
                    Color.gray
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                }
            }

            Text(viewModel.user?.username ?? "User")
                .font(.footnote)
                .foregroundStyle(Color(.buttonText))
        }.onAppear {
            viewModel.story = story
        }
    }
}
