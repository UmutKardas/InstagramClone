//
//  ProfileButtonView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 16.09.2024.
//

import SwiftUI

struct ProfileButtonView: View {
    @Binding var title: String

    var isMyProfile: Bool = false
    var onEditingProfile: () -> Void
    var onFollow: () -> Void

    var body: some View {
        Button {
            if isMyProfile {
                onEditingProfile()
            } else {
                onFollow()
            }
        } label: {
            Text(title)
                .fontWeight(.semibold)
                .font(.subheadline)
                .foregroundStyle(Color(.buttonText))
                .frame(width: 350, height: 30)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                }
        }
    }
}
