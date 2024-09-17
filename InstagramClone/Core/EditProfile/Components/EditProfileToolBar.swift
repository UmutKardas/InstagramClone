//
//  EditProfileToolBar.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 16.09.2024.
//

import Foundation
import SwiftUI

struct EditProfileToolBar: ToolbarContent {
    var cancelAction: () -> Void
    var uploadAction: () -> Void

    var body: some ToolbarContent {
        Group {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    cancelAction()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Upload") {
                    uploadAction()
                }
            }
        }
    }
}
