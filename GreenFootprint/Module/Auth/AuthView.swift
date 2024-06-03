//
//  AuthView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    @State private var showSignUp: Bool = false
    @State private var showReset: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    viewModel.login()
                } label: {
                    Text("Login")
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button {
                    showSignUp = true
                } label: {
                    Text("SignUp")
                }
                
                Button {
                    showReset = true
                } label: {
                    Text("Reset")
                }
            }
            .padding()
            .navigationDestination(isPresented: $showSignUp) {
                SignUpView()
            }
            .navigationDestination(isPresented: $showReset) {
                ResetView()
            }
        }
    }
}
