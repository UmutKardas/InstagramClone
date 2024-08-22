//
//  UploadViewModel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 19.08.2024.
//

import Foundation
import PhotosUI
import SwiftUI

class UploadViewModel: ObservableObject {
    @Published var image: Image?
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await self.loadItem(fromItem: self.selectedItem) }}
    }

    private func loadItem(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.image = Image(uiImage: uiImage)
    }
    
    func resetViewModel (){
        image = nil
        selectedItem = nil
    }
}
