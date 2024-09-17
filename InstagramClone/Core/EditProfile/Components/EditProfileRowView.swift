//
//  EditProfileRowView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 16.09.2024.
//

import Foundation
import SwiftUI

struct EditProfileRowView: View {
    var title: String = ""
    var placeholder: String = ""
    var textField: Binding = .constant("")

    var body: some View {
        HStack(spacing: 30) {
            Text(title)
                .padding(.leading, 10)
                .frame(width: 60, alignment: .leading)
                .lineLimit(1)
                .minimumScaleFactor(0.5)

            VStack {
                TextField(placeholder, text: textField)
                Divider()
            }
        }
    }
}

#Preview {
    EditProfileRowView(title: "Name", placeholder: "Enter Your Name...", textField: Binding.constant(""))
}
