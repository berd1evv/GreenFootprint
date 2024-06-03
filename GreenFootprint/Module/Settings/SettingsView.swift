//
//  SettingsView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var isSecure: Bool = false
    var body: some View {
        VStack {
            List {
                Toggle("User privacy", isOn: $isSecure)
            }
        }
        .navigationTitle("Settings")
    }
}
