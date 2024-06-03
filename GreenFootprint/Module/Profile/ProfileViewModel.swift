//
//  ProfileViewModel.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class ProfileViewModel: ObservableObject {
    
    @Published var user: User = User(name: "", surname: "", isPrivate: true)
    
    func getProfile() {
        let db = Firestore.firestore()
        db.collection("users").document(Auth.auth().currentUser?.uid ?? "").getDocument(as: User.self) { result in
            switch result {
            case .success(let success):
                self.user = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func changeProfile(completion: @escaping ()->()) {
        do {
            let db = Firestore.firestore()
            try db.collection("users").document(Auth.auth().currentUser?.uid ?? "").setData(from: self.user)
            completion()
        } catch let error {
          print("Error writing city to Firestore: \(error)")
        }
    }
}
