//
//  RepoListCoordinator.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import SwiftUI

struct RepoListCoordinator: View {
    @State private var selectedRepo: Repo?
    
    var body: some View {
        VStack {
            RepoListView(tapOnRepoAction: { repo in
                selectedRepo = repo
            })
            .listStyle(PlainListStyle())
            
            EmptyNavigationLink(destination: Text("Repo detail \(selectedRepo?.name ?? "")"), selectedItem: $selectedRepo)
        }
        .navigationBarTitle("huynguyencong's repos", displayMode: .inline)
    }
}
