//
//  Reel.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 21.08.2024.
//

import Foundation

struct Reel: Identifiable {
    let id = UUID()
    let videoURL: URL
}

extension Reel {
    static let MOCK_REELS: [Reel] = [
        Reel(videoURL: Bundle.main.url(forResource: "dummyVideo", withExtension: "mp4")!),
        Reel(videoURL: Bundle.main.url(forResource: "dummyVideo", withExtension: "mp4")!),
        Reel(videoURL: Bundle.main.url(forResource: "dummyVideo", withExtension: "mp4")!),
        Reel(videoURL: Bundle.main.url(forResource: "dummyVideo", withExtension: "mp4")!),
        Reel(videoURL: Bundle.main.url(forResource: "dummyVideo", withExtension: "mp4")!),
        Reel(videoURL: Bundle.main.url(forResource: "dummyVideo", withExtension: "mp4")!)
    ]
}
