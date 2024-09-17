//
//  MainTabBarView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import FirebaseAuth
import SwiftUI

struct MainTabBarView: View {
    @State var selectedIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeUIView()
                .tabItem { Image(systemName: "house") }
                .tag(0)
            SearchUIView()
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            UploadUIView(selectionIndex: $selectedIndex)
                .tabItem { Image(systemName: "plus.square") }
                .tag(2)
            ReelsUIView()
                .tabItem { Image(systemName: "play.square") }
                .tag(3)
            ProfileUIView(userId: Auth.auth().currentUser?.uid ?? "")
                .tabItem { Image(systemName: "person") }
                .tag(4)
        }
        .accentColor(Color(.tabBarItem))
    }
}

#Preview {
    MainTabBarView()
}
