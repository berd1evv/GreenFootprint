//
//  SignUpView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                viewModel.register()
            } label: {
                Text("SignUp")
            }
        }
    }
}
