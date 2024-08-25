//
//  ContentView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabBarView()
            } else {
                LoginUIView()
            }
        }
    }
}

#Preview {
    ContentView()
}
