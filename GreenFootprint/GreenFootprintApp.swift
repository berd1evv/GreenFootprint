//
//  GreenFootprintApp.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI

@main
struct GreenFootprintApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage(UserDefaultsStorage.active) private var active = false
    
    var body: some Scene {
        WindowGroup {
            if !active {
                auth
            } else {
                main
            }
        }
    }
    
    var auth: some View {
        AuthView()
    }
    
    var main: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "house") }
                )
            }
            .tag(0)
            
            NavigationStack {
                MoreView()
            }
            .tabItem {
                Label(
                    title: { Text("More") },
                    icon: { Image(systemName: "list.bullet") }
                )
            }
            .tag(2)
        }
    }
}
