//
//  ProfileView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $viewModel.user.name)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Surname", text: $viewModel.user.surname)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button {
                viewModel.changeProfile {
                    print("Success")
                }
            } label: {
                Text("Save")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            viewModel.getProfile()
        }
    }
}
