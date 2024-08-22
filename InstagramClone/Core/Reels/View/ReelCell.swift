//
//  ReelCell.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 21.08.2024.
//

import AVKit
import SwiftUI

struct ReelCell: View {
    @State private var player: AVPlayer? = nil

    let videoURL: URL

    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .onAppear {
                    player = AVPlayer(url: videoURL)
                    player?.play()
                    player?.isMuted = true
                }
                .onDisappear {
                    player?.pause()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)

            HStack(alignment: .bottom, spacing: 10) {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Color.gray
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())

                        Text("umtkardas")
                            .foregroundColor(.white)
                            .font(.footnote)

                        Button(action: {}) {
                            Text("Follow")
                                .font(.caption)
                                .foregroundColor(.white)
                                .frame(width: 60, height: 20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                        .padding(.leading, 5)
                    }

                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
                .padding(.leading, 20)

                Spacer()

                VStack(alignment: .trailing, spacing: 15) {
                    ReelItemUIView(imageName: "heart", text: "50.6K")
                    ReelItemUIView(imageName: "message", text: "212")
                    ReelItemUIView(imageName: "paperplane", text: "66.8K")
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .imageScale(.large)
                        .padding(.top, 5)
                }
                .padding([.trailing, .bottom], 20)
            }
            .padding(.top, UIScreen.main.bounds.height * 0.5)
        }.padding(.vertical, 20)
    }
}

#Preview {
    ReelCell(videoURL: Reel.MOCK_REELS.first!.videoURL)
}
