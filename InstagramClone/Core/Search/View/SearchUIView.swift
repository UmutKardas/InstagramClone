//
//  SearchUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 18.08.2024.
//

import SwiftUI

struct SearchUIView: View {
    @StateObject var viewModel: SearchViewModel = .init()

    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.textField.isEmpty {
                    SearchDefaultUIView(viewModel: viewModel)
                }
                else {
                    SearchResultUIView(viewModel: viewModel)
                }
            }.searchable(text: $viewModel.textField, prompt: "Search")
                .onChange(of: viewModel.textField) { _, _ in
                    Task {
                        await viewModel.searchUsers()
                    }
                }
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
        }
    }
}

#Preview {
    SearchUIView()
}
