//
//  SignUpCompleteUIView.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 22.08.2024.
//

import SwiftUI

struct SignUpCompleteUIView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @State var isPresentAlert: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Text("Welcome to Instagram, \(viewModel.username)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.buttonText)
                    .padding(.top)
                    .multilineTextAlignment(.center)

                Text("Complete registration below to start using Instagram.")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .lineLimit(1)
                    .padding(.horizontal, 24)

                Button {
                    Task {
                        await viewModel.register()

                        DispatchQueue.main.async {
                            if !viewModel.error.isEmpty {
                                isPresentAlert.toggle()
                            }
                        }
                    }
                } label: {
                    Text("Complete Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.buttonText)
                        .frame(width: 340, height: 45)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6, style: .circular)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }
            }.alert(isPresented: $isPresentAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.error), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    SignUpCompleteUIView()
        .environmentObject(RegisterViewModel())
}
