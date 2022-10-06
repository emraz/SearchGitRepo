//
//  GitRepo.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import Foundation

struct GitRepo: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
    
    init(totalCount: Int? = 0, isIncomplete: Bool? = false, items: [Item]? = []) {
        self.totalCount = totalCount
        self.incompleteResults = isIncomplete
        self.items = items
    }
}
