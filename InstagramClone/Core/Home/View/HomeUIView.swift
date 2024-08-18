import SwiftUI

struct HomeUIView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Stories Section
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        ForEach(0...10, id: \.self) { _ in
                            StoryCellUIView()
                        }
                    }
                }
                .padding(.horizontal, 3)
                .frame(height: 100)

                // Posts Section
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(0...10, id: \.self) { _ in
                            PostCellUIView()
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
                
                ToolbarItem(placement: .topBarLeading){
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
