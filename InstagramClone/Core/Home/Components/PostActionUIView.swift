//
//  PostActionUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct PostActionUIView: View {
    let imageName: String
    let value: Int
    let action: () -> Void

    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                Image(systemName: imageName)
                    .foregroundStyle(Color(.buttonText))
                    .imageScale(.large)
            }

            Text("\(value)")
        }
    }
}

#Preview {
    PostActionUIView(imageName: "heart", value: 1000) {
        print("Clicked")
    }
}
