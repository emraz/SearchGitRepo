//
//  GitRepoSearchAPIServiceTests.swift
//  SearchGitRepoTests
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import XCTest
import Combine

@testable import SearchGitRepo

final class GitRepoSearchAPIServiceTests: XCTestCase {
    
    var sut: GitRepoSearchMockAPIService!
    private var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GitRepoSearchMockAPIService()
        cancellables = []
    }

    override func tearDownWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = nil
    }
    
    
    // MARK: - Successful API call with local json data
    func test_local_json_data_for_git_repo_and_decode_success() {
        
        // Data Parsing
        
        sut.repositoryList(for: .gitRepoSearch(withText: "text"))
            .map { $0.items! }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: { value in
                XCTAssertNotNil(value)
                switch value {
                case .failure(let encounteredError):
                    XCTAssertNil(encounteredError)
                case .finished:
                    break
                }
            }, receiveValue: { repoValue in
                
                XCTAssertTrue(repoValue.count > 0)
                // Data populate to ViewModel Test
                let item = repoValue.first
                XCTAssertEqual(item?.id, 3081286)
                XCTAssertEqual(item?.htmlURL, "https://github.com/dtrupenn/Tetris")
                XCTAssertEqual(item?.owner?.id, 872147)
                XCTAssertEqual(item?.owner?.avatarURL, "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png")
            })
            .store(in: &cancellables)
    }
}
