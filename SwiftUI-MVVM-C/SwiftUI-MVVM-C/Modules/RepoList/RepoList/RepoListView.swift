//
//  RepoListView.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import SwiftUI

struct RepoListView: View {
    @StateObject var viewModel = RepoListViewModel()
    
    var body: some View {
        List(viewModel.repos) { repo in
            RepoCell(repo: repo)
        }
        .onAppear {
            viewModel.getRepos()
        }
    }
}
