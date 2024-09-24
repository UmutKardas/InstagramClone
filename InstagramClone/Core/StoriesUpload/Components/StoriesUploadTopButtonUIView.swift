//
//  StoriesUploadTopButtonUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.09.2024.
//

import SwiftUI

struct StoriesUploadTopButtonUIView: View {
    var image: Image
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(8)
                .background(Color(.darkGray).opacity(0.6)) // #1F1F1F
                .foregroundColor(.white)
                .clipShape(Circle())
        }
    }
}

#Preview {
    StoriesUploadTopButtonUIView(image: Image(systemName: "chevron.left"), action: {})
}
