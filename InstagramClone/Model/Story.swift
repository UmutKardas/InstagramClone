//
//  Story.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 28.08.2024.
//

import Foundation

struct Story: Identifiable, Codable, Hashable {
    let id: String
    let userId: String
    let imageData: String
    let date: Date
}
