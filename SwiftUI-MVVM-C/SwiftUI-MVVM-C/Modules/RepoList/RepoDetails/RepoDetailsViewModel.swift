//
//  RepoDetailsViewModel.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/18/21.
//

import Foundation
import Combine

class RepoDetailsViewModel: ObservableObject {
    
    @Published var repo: Repo?
    
    var networkClient: GithubNetworkProvider = GithubNetworkClient()
    
    var s = Set<AnyCancellable>()
    
    func getRepo(username: String, name: String) {
        networkClient.getRepo(username: username, name: name)
            .map({ Optional.some($0) })
            .replaceError(with: nil)
            .assign(to: &$repo)
    }
}
