//
//  GitRepoSearchAPIService.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import Foundation
import Combine

protocol GitRepoSearchAPIServiceProtocol {
    func repositoryList(for endPoint: GitRepoAPI) -> AnyPublisher<GitRepo, RepoSearchError>
}

struct GitRepoSearchAPIService: GitRepoSearchAPIServiceProtocol {
    func repositoryList(for endPoint: GitRepoAPI) -> AnyPublisher<GitRepo, RepoSearchError> {
        guard let request = endPoint.request else {
            let error = RepoSearchError.networkError(description: "Wrong URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: request)
          .map { $0.data }
          .decode(type: GitRepo.self, decoder: JSONDecoder())
          .mapError { error in
            .decodingError(description: error.localizedDescription)
          }
          .eraseToAnyPublisher()
    }
}

internal struct GitRepoSearchMockAPIService: GitRepoSearchAPIServiceProtocol {
    
    func repositoryList(for endPoint: GitRepoAPI) -> AnyPublisher<GitRepo, RepoSearchError> {
        
        var jsonData: Data?
        jsonData = Bundle.main.jsonData(fileName: "gitData")
        
        guard let data = jsonData else {
            return Fail(error: .networkError(description: "Empty Data"))
                    .eraseToAnyPublisher()
        }
        
        let response = Response(data: data)
        
        guard let decoded = response.decode(GitRepo.self) else {
            return Fail(error: .networkError(description: "Empty Data"))
                    .eraseToAnyPublisher()
        }
        
        return CurrentValueSubject(decoded).eraseToAnyPublisher()
        
    }
}
