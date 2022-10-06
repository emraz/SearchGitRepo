//
//  GitRepoSearchAPIServiceTests.swift
//  SearchGitRepoTests
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import XCTest
@testable import SearchGitRepo

final class GitRepoSearchAPIServiceTests: XCTestCase {
    
    var sut: GitRepoSearchMockAPIService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GitRepoSearchMockAPIService()
    }

    override func tearDownWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = nil
    }
    
    // MARK: - Successful API call with local json data
    func test_local_json_data_for_git_repo_and_decode_success() {
        
        sut.repositoryList(for: .gitRepoSearch(withText: "text"))
            .map { $0.items! }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: { value in
                XCTAssertNotNil(value)
                switch value {
                case .failure:
                    XCTFail("It should be a success.")
                case .finished:
                    break
                }
              },
                receiveValue: { repoValue in
                XCTAssertTrue(repoValue.count > 0)
            })
    }
}
