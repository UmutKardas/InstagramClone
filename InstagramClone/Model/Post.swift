//
//  Post.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 28.08.2024.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let userId: String
    let caption: String
    let likes: [String]
    let shares: [String]
    let imageData: String
    let comments: [String: String]
    let createdDate: Date
}
