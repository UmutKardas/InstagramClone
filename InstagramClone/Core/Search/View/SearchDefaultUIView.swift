//
//  SearchDefaultUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct SearchDefaultUIView: View {
    let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1, content: {
            ForEach(0 ... 20, id: \.self) { _ in
                Color.gray
                    .scaledToFill()
            }
        })
    }
}

#Preview {
    SearchDefaultUIView()
}
