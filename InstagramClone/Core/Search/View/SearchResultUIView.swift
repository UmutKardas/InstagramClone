//
//  SearchResultUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct SearchResultUIView: View {
    var body: some View {
        LazyVStack {
            ForEach(0 ... 10, id: \.self) { _ in
                HStack {
                    Color.gray
                        .frame(width: 30, height: 30)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .scaledToFill()

                    Text("umtkardas")
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    SearchResultUIView()
}
