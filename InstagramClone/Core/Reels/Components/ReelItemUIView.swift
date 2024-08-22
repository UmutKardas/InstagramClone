//
//  ReelItemUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 21.08.2024.
//

import SwiftUI

struct ReelItemUIView: View {
    var imageName: String
    var text: String

    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: imageName)
                .foregroundStyle(Color(.white))
                .imageScale(.large)
            Text(text)
                .foregroundStyle(Color(.white))
                .font(.footnote)
        }
    }
}

#Preview {
    ReelItemUIView(imageName: "paperplane", text: "66.8K")
}
