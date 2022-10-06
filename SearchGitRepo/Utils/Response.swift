//
//  Response.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import UIKit

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch {
            return nil
        }
    }
}

