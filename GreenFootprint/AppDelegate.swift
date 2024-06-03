//
//  AppDelegate.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import Foundation
import FirebaseCore
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
