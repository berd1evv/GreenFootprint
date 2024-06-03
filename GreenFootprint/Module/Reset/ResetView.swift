//
//  ResetView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI

struct ResetView: View {
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    @State private var showSuccess: Bool = false
    
    var body: some View {
        VStack {
            if showSuccess {
                Text("Reset link has been successfully sent to your email")
            }
            
            TextField("Email", text: $viewModel.email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                viewModel.reset {
                    showSuccess = true
                }
            } label: {
                Text("Reset")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
