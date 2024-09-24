//
//  StoryProgressBarUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 19.09.2024.
//

import SwiftUI

struct StoryProgressBarUIView: View {
    @ObservedObject var viewModel: StoriesViewModel

    var body: some View {
        ProgressView(value: viewModel.progress, total: 1)
            .progressViewStyle(LinearProgressViewStyle(tint: .white))
            .frame(height: 5)
            .padding(.horizontal, 5)
            .onAppear {
                viewModel.startTimer()
            }
    }
}

#Preview {
    ZStack {
        Color.black
        StoryProgressBarUIView(viewModel: StoriesViewModel())
    }
}
