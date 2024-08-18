//
//  MainTabBarView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            HomeUIView().tabItem { Image(systemName: "house") }
            SearchUIView().tabItem { Image(systemName: "magnifyingglass") }
            UploadUIView().tabItem { Image(systemName: "plus.square") }
            ReelsUIView().tabItem { Image(systemName: "play.square") }
            ProfileUIView().tabItem { Image(systemName: "person") }
        }
        .accentColor(Color(.tabBarItem))
    }
}

#Preview {
    MainTabBarView()
}
