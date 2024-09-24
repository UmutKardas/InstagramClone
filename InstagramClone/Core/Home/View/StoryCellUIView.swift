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
            NavigationLink {
                view
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                    .toolbar(.hidden, for: .tabBar)
            } label: {
                VStack(spacing: 5) {
                    ZStack {
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

                        if story != nil {
                            Circle()
                                .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange],
                                                       startPoint: .topLeading,
                                                       endPoint: .bottomTrailing), lineWidth: 2.3)
                                .frame(width: 75, height: 75)
                        }
                        else {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(5)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(Circle())
                                .offset(x: 25, y: 25)
                        }
                    }

                    Text(viewModel.user?.username ?? "User")
                        .font(.footnote)
                        .frame(width: 70, height: 30)
                        .foregroundStyle(Color(.buttonText))
                }
            }

        }.onAppear {
            viewModel.story = story
        }
    }
}
