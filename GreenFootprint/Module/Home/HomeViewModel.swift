//
//  HomeViewModel.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class HomeViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    func fetchProducts() {
        let db = Firestore.firestore()
        db.collection("products").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.products = querySnapshot?.documents.compactMap({
                    try? $0.data(as: Product.self)
                }) ?? []
                print(self.products)
            }
        }
    }
}
