//
//  UserStatUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct UserStatUIView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .fontWeight(.semibold)
                .font(.subheadline)
            Text(title)
        }
        .frame(width: 90)
    }
}

#Preview {
    UserStatUIView(value: 10, title: "Post")
}
