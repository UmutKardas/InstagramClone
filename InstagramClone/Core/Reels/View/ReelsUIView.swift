//
//  ReelsUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct ReelsUIView: View {
    @StateObject var viewModel: ReelsViewModel = .init()

    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(Reel.MOCK_REELS) { reel in
                    ReelCell(viewModel: viewModel, videoURL: reel.videoURL)
                        .frame(width: geometry.size.width)
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea(.all, edges: .horizontal)
                }
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: geometry.size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: geometry.size.width)
            .background(.black)

            Spacer()
        }
        .ignoresSafeArea(.all, edges: .horizontal)
    }
}

#Preview {
    ReelsUIView()
}
