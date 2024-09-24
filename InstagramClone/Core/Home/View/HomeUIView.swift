import SwiftUI

struct HomeUIView: View {
    @StateObject var viewModel: HomeViewModel = .init()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Stories Section
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        if (viewModel.user?.id) != nil {
                            StoryCellUIView(story: nil, view: StoriesUploadUIView())
                        }

                        ForEach(viewModel.stories?.filter { $0.userId != viewModel.user?.id } ?? [], id: \.self) { story in
                            StoryCellUIView(story: story, view: StoriesUIView(story: story))
                        }
                    }
                }
                .padding(.horizontal, 3)
                .frame(height: 120)

                // Posts Section
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(viewModel.posts ?? [], id: \.self) { post in
                            PostCellUIView(post: post)
                        }
                    }
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button {
                            print("Clicked Heart Button")
                        } label: {
                            Image(systemName: "heart")
                                .foregroundStyle(Color(.buttonText))
                        }

                        Button {
                            print("Clicked Message Button")

                        } label: {
                            Image(systemName: "message")
                                .foregroundStyle(Color(.buttonText))
                        }
                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    Image("instagramLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 32)
                }
            })
        }
    }
}

#Preview {
    HomeUIView()
}
