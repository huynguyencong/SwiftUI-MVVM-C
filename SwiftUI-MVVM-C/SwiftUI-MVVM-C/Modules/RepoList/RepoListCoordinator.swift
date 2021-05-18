//
//  RepoListCoordinator.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import SwiftUI

struct RepoListCoordinator: View {
    @State private var selectedRepo: Repo?
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            RepoListView(tapOnRepoAction: { repo in
                selectedRepo = repo
            })
            .listStyle(PlainListStyle())
            
            if let selectedRepo = selectedRepo {
                EmptyNavigationLink(destination: RepoDetailsView(inputRepo: selectedRepo, tapOnLinkAction: tapOnLinkAction), selectedItem: $selectedRepo)
            }
        }
        .navigationBarTitle("huynguyencong's repos", displayMode: .inline)
    }
    
    private func tapOnLinkAction(url: URL) {
        openURL(url)
    }
}
