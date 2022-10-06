//
//  APIServiceError.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import Foundation

enum RepoSearchError: Error {
    case decodingError(description: String)
    case networkError(description: String)
    case unknown
}
