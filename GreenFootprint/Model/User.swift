//
//  User.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import Foundation

struct User: Codable {
    var name: String
    var surname: String
    var isPrivate: Bool
    var isWomanOwned: Bool
    var isCompostable: Bool
    var isParabenFree: Bool
    var isCharitable: Bool
    
    enum CodingKeys: CodingKey {
        case name
        case surname
        case isPrivate
        case isWomanOwned
        case isCompostable
        case isParabenFree
        case isCharitable
    }
    
    init(name: String, surname: String, isPrivate: Bool) {
        self.name = name
        self.surname = surname
        self.isPrivate = isPrivate
        self.isWomanOwned = false
        self.isCompostable = false
        self.isParabenFree = false
        self.isCharitable = false
    }
}
