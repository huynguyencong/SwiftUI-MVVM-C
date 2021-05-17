//
//  SwiftUI_MVVM_CTests.swift
//  SwiftUI-MVVM-CTests
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import XCTest
import Combine
@testable import SwiftUI_MVVM_C

class SwiftUI_MVVM_CTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testGithubNetworkProviderGetRepos() {
        let exp = expectation(description: "Parse repos success")
        var subscriptions = Set<AnyCancellable>()
        
        let networkClient = TestUtils.mockNetworkClient(file: "repos.json")
        let githubNetworkClient = GithubNetworkClient()
        githubNetworkClient.networkClient = networkClient
        
        githubNetworkClient.getRepos(username: "huynguyencong").sink { _ in } receiveValue: { repos in
            let firstRepo = repos.first
            let isCorrectParsing = firstRepo?.id != nil && firstRepo?.name != nil
            
            XCTAssert(isCorrectParsing)
            
            exp.fulfill()
        }.store(in: &subscriptions)

        wait(for: [exp], timeout: 0.5)
    }

}
