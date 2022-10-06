//
//  Item.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: Int?
    let owner: Owner?
    let htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case owner
        case htmlURL = "html_url"
    }
}

extension Item: Hashable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
