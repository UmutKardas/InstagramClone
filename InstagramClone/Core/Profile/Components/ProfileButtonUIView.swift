//
//  ProfileButtonUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 16.09.2024.
//

import SwiftUI

struct ProfileButtonUIView: View {
    var isEditingProfile: Bool = false
    var onEditingProfile: () -> Void
    var onFollow: () -> Void

    var body: some View {
        
        .disabled(false)
    }
}
