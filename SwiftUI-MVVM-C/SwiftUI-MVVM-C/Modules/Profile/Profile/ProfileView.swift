//
//  ProfileView.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/18/21.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    let username: String
    let tapOnLinkAction: (URL) -> Void
    
    var user: User? {
        viewModel.user
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(user?.login ?? "")
                .font(.title)
                .leadingAlignment()
            
            Text(user?.name ?? "")
                .font(.title2)
                .leadingAlignment()
            
            Text(user?.bio ?? "")
            
            VStack {
                Text("Public repos: \(user?.publicRepos ?? 0)")
                    .leadingAlignment()
                Text("Public gists: \(user?.publicGists ?? 0)")
                    .leadingAlignment()
                Text("Followers: \(user?.followers ?? 0)")
                    .leadingAlignment()
                Text("Following: \(user?.following ?? 0)")
                    .leadingAlignment()
            }
            
            Button("Open Github website to see more details") {
                if let url = user?.htmlURL {
                    tapOnLinkAction(url)
                }
            }
            .leadingAlignment()
            
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            viewModel.getUser(username: username)
        })
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}
