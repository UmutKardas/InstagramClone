//
//  StoryCellUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct StoryCellUIView: View {
    var body: some View {
        VStack{
            Color.gray
                .frame(width: 70, height: 70)
                .scaledToFill()
                .clipShape(Circle())
            
            Text("umtkardas")
                .font(.footnote)
                .foregroundStyle(Color(.buttonText))
        }
    }
}

#Preview {
    StoryCellUIView()
}
