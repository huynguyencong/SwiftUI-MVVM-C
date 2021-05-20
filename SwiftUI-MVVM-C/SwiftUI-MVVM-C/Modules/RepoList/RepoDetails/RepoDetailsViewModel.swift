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
    
    @Published var repoName: String?
    @Published var forkText: String?
    @Published var isForkTextDisplayed: Bool = false
    @Published var description: String?
    @Published var isDescriptionTextDisplayed: Bool = false
    
    var networkClient: GithubNetworkProvider = GithubNetworkClient()
    
    var s = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
    private func bind() {
        $repo.map({ $0?.name }).assign(to: &$repoName)
        $repo.map({ $0?.fork ?? false }).assign(to: &$isForkTextDisplayed)
        $repo.map({ [unowned self] in forkedText(repo: $0) }).assign(to: &$forkText)
        $repo.map({ $0?.description }).assign(to: &$description)
        $repo.map({ $0?.description != nil }).assign(to: &$isDescriptionTextDisplayed)
    }
    
    func getRepo(username: String, name: String) {
        networkClient.getRepo(username: username, name: name)
            .map({ Optional.some($0) })
            .replaceError(with: nil)
            .assign(to: &$repo)
    }
    
    private func forkedText(repo: Repo?) -> String {
        if let repo = repo?.source?.value {
            return "Forked from \(repo.fullName ?? "")"
        } else {
            return "Forked from other repo"
        }
    }
}
