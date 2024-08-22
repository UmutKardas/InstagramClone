//
//  SearchUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct SearchUIView: View {
    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    SearchDefaultUIView()
                }
                else {
                    SearchResultUIView()
                }
            }.searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    SearchUIView()
}
