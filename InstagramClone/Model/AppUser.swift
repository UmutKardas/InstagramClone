//
//  AppUser.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 25.08.2024.
//

import Foundation

struct AppUser: Identifiable, Encodable, Decodable, Hashable {
    var id: String
    var username: String
    var email: String
    var profilePictureData: String
    var fullname: String
    var biography: String
    var followers: [String] = []
    var following: [String] = []

    init(id: String, username: String, email: String) {
        self.id = id
        self.username = username
        self.email = email
        self.profilePictureData = ""
        self.fullname = ""
        self.biography = ""
        self.followers = []
        self.following = []
    }
}
