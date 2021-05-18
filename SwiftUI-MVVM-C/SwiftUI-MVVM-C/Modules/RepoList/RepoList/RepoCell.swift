//
//  RepoCell.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import SwiftUI

struct RepoCell: View {
    let repo: Repo
    
    var body: some View {
        VStack {
            Text(repo.name ?? "")
                .leadingAlignment()
            
            if (repo.fork ?? false) {
                Text("Forked from other repo")
                    .font(.caption)
                    .leadingAlignment()
            }
            
            if let description = repo.description {
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .leadingAlignment()
            }
        }
    }
}
