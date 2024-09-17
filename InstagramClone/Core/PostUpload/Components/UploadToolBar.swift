//
//  UploadToolBar.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 11.09.2024.
//

import SwiftUI

struct UploadToolBar: ToolbarContent {
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
