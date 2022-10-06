//
//  Owner.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import Foundation

struct Owner: Codable {
    let id: Int?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatar_url"
    }
}
