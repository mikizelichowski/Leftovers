//
//  Recipe.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 30/10/2023.
//

import Foundation

struct Recipe: Codable {
    var id: Int
    var title: String
    var time: Int
    var image: String
    var rating: Double?
    var profileImage: String?
    var author: String?
}
