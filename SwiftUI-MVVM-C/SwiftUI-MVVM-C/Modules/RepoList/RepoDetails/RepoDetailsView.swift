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
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                VStack {
                    Text(viewModel.repoName ?? "")
                        .font(.title)
                        .leadingAlignment()
                    
                    if viewModel.isForkTextDisplayed {
                        Text(viewModel.forkText ?? "")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .leadingAlignment()
                    }
                }
                
                if viewModel.isDescriptionTextDisplayed {
                    Text(viewModel.description ?? "")
                        .leadingAlignment()
                }
                
                Button("Open Github website to see more details") {
                    if let url = viewModel.repo?.htmlURL {
                        tapOnLinkAction(url)
                    }
                }
                .leadingAlignment()
            }
            .padding()
        }
        .onLoad {
            viewModel.repo = inputRepo
            
            if let username = inputRepo.owner?.login, let name = inputRepo.name {
                viewModel.getRepo(username: username, name: name)
            }
        }
    }
    
    var forkedText: String {
        if let sourceRepo = viewModel.repo?.source?.value {
            return "Forked from \(sourceRepo.fullName ?? "")"
        } else {
            return "Forked from other repo"
        }
    }
}
