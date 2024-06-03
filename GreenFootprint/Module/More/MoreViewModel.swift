//
//  MoreViewModel.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import Foundation
import Firebase

class MoreViewModel: ObservableObject {
    
    
    func logout() {
        do {
            try Auth.auth().signOut()
            Storage.shared.setActive(false)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
