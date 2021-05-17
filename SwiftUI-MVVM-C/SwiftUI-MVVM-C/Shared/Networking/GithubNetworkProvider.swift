//
//  GithubNetworkProvider.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation
import Combine

protocol GithubNetworkProvider {
    func getRepos(username: String) -> AnyPublisher<[Repo], Error>
}

class GithubNetworkClient: GithubNetworkProvider {
    var networkClient = NetworkClient.instance
    
    func getRepos(username: String) -> AnyPublisher<[Repo], Error> {
        networkClient.request(GithubRouter.repos(username: username)).decode()
    }
}
