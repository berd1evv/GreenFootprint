//
//  MoreView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI

struct MoreView: View {
    @StateObject var viewModel: MoreViewModel = MoreViewModel()
    
    @State private var showLogoutAlert: Bool = false
    
    var body: some View {
        VStack {
            List {
                NavigationLink {
                    SettingsView()
                } label: {
                    Text("Settings")
                }
                
                Section {
                    Button(action: {
                        showLogoutAlert = true
                    }, label: {
                        Text("Log out")
                    })
                }
            }
        }
        .navigationTitle("More")
        .alert(isPresented: $showLogoutAlert, content: {
            Alert(title: Text("Do you really want to log out?"),
                  primaryButton: .cancel(),
                  secondaryButton: .destructive(
                    Text("Logout"), action: {
                        viewModel.logout()
                    }))
        })

        
    }
}
