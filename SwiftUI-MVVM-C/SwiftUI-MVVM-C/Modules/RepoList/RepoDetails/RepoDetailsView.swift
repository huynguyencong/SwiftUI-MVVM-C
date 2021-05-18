//
//  RepoDetailsView.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/18/21.
//

import SwiftUI

struct RepoDetailsView: View {
    @StateObject var viewModel = RepoDetailsViewModel()
    let inputRepo: Repo
    let tapOnLinkAction: (URL) -> Void
    
    var repo: Repo {
        viewModel.repo ?? inputRepo
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                VStack {
                    Text(repo.name ?? "")
                        .font(.title)
                        .leadingAlignment()
                    
                    if (repo.fork ?? false) {
                        Text(forkedText)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .leadingAlignment()
                    }
                }
                
                if let description = repo.description {
                    Text(description)
                        .leadingAlignment()
                }
                
                Button("Open Github website to see more details") {
                    if let url = repo.htmlURL {
                        tapOnLinkAction(url)
                    }
                }
                .leadingAlignment()
            }
            .padding()
        }
        .onAppear(perform: {
            if let username = inputRepo.owner?.login, let name = inputRepo.name {
                viewModel.getRepo(username: username, name: name)
            }
        })
    }
    
    var forkedText: String {
        if let sourceRepo = viewModel.repo?.source?.value {
            return "Forked from \(sourceRepo.fullName ?? "")"
        } else {
            return "Forked from other repo"
        }
    }
}
