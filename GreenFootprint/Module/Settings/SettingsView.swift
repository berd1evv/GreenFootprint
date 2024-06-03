//
//  SettingsView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: MoreViewModel = MoreViewModel()

    var body: some View {
        VStack {
            List {
                Toggle("User privacy", isOn: $viewModel.user.isPrivate)
            }
        }
        .navigationTitle("Settings")
        .onAppear {
            viewModel.getProfile()
        }
        .onChange(of: viewModel.user.isPrivate) {
            viewModel.changeProfile {}
        }
    }
}
