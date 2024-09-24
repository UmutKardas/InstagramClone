//
//  StoriesUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 11.09.2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct StoriesUIView: View {
    @StateObject var viewModel: StoriesViewModel = .init()
    @Environment(\.dismiss) var dismiss

    var story: Story?

    var body: some View {
        ZStack {
            Color(.black)
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()

            VStack {
                ZStack {
                    WebImage(url: URL(string: viewModel.story?.imageData ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.3)
                            .clipped()
                    } placeholder: {
                        Color.green
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.3)
                    }

                    VStack(spacing: 10) {
                        StoryProgressBarUIView(viewModel: viewModel)

                        HStack(spacing: 8) {
                            WebImage(url: URL(string: viewModel.user?.profilePictureData ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(20)
                                    .clipped()
                            } placeholder: {
                                Color.black
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(20)
                            }

                            Text(viewModel.user?.username ?? "user")
                                .font(.footnote)
                                .foregroundStyle(.white)

                            Text(viewModel.story?.date.formattedDate() ?? "5h")
                                .font(.footnote)
                                .foregroundStyle(.white.opacity(0.5))

                            Spacer()
                            Button {} label: {
                                Image(systemName: "ellipsis")
                                    .rotationEffect(.degrees(90))
                                    .foregroundStyle(.white)
                            }
                        }.padding(.horizontal, 15)
                    }
                    .frame(maxHeight: UIScreen.main.bounds.height / 1.3, alignment: .top)
                    .padding(.top, 15)
                }
                HStack(spacing: 15) {
                    TextField("", text: $viewModel.caption, prompt: Text("Send message")
                        .foregroundStyle(.white.opacity(0.9)))
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1.0)
                        }
                        .foregroundColor(.white)
                        .autocorrectionDisabled(true)

                    Button {} label: {
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                    }

                    Button {} label: {
                        Image(systemName: "paperplane")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.horizontal, 16)
            }
            .onAppear {
                viewModel.story = self.story
                viewModel.dismiss = {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    StoriesUIView()
}
