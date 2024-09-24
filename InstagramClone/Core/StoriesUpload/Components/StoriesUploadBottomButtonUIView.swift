//
//  StoriesUploadBottomButtonUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 17.09.2024.
//

import SwiftUI

struct StoriesUploadBottomButtonUIView: View {
    var imageName: String
    var title: String
    var imageColor: Color

    var body: some View {
        Button {} label: {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 10)
                    .foregroundColor(imageColor)

                Text(title)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, minHeight: 35)
            .background(Color(UIColor(red: 31/255, green: 31/255, blue: 31/255, alpha: 1))) // #1F1F1F
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }
}

#Preview {
    StoriesUploadBottomButtonUIView(imageName: "person.circle.fill", title: "Your Story", imageColor: .white)
}
