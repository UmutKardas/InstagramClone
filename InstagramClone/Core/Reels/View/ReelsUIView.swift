//
//  ReelsUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct ReelsUIView: View {
    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(Reel.MOCK_REELS) { reel in
                    ReelCell(videoURL: reel.videoURL)
                        .frame(width: geometry.size.width)
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea(.all, edges: .top)
                }
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: geometry.size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: geometry.size.width)
            .background(.black)
           
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
        .edgesIgnoringSafeArea(.leading)
    }
}

#Preview {
    ReelsUIView()
}
