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
        Form {
            TextField("Name", text: $viewModel.user.name)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            TextField("Surname", text: $viewModel.user.surname)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            TextField("Email*", text: $viewModel.email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            SecureField("Password*", text: $viewModel.password)
            
            SecureField("Confirm Password*", text: $viewModel.confirmPassword)
            
            Button {
                viewModel.register()
            } label: {
                Text("SignUp")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
