//
//  Product.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let price: Double
    let image: String
    let sustainability: [String]
    
    enum CodingKeys: CodingKey {
        case name
        case description
        case price
        case image
        case sustainability
    }
    
    init(name: String, description: String, price: Double, image: String, sustainability: [String]) {
        self.name = name
        self.description = description
        self.price = price
        self.image = image
        self.sustainability = sustainability
    }
    
    init() {
        self.name = ""
        self.description = ""
        self.price = 0
        self.image = ""
        self.sustainability = []
    }
}
