//
//  SearchDefaultUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SDWebImageSwiftUI
import SwiftUI

struct SearchDefaultUIView: View {
    @ObservedObject var viewModel: SearchViewModel

    let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1, content: {
            ForEach(viewModel.timeLinePosts ?? []) { post in
                WebImage(url: URL(string: post.imageData)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 3 - 2, height: UIScreen.main.bounds.width / 3 - 2)
                        .clipped()
                } placeholder: {
                    Color(.gray)
                        .frame(width: UIScreen.main.bounds.width / 3 - 2, height: UIScreen.main.bounds.width / 3 - 2)
                        .scaledToFill()
                }
            }
        })
    }
}

#Preview {
    SearchDefaultUIView(viewModel: SearchViewModel())
}
