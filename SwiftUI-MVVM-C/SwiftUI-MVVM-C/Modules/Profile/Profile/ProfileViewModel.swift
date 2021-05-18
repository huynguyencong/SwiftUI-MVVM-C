//
//  ProfileViewModel.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/18/21.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    
    var networkClient: GithubNetworkProvider = GithubNetworkClient()
    
    func getUser(username: String) {
        networkClient.getUser(username: username)
            .optionalize()
            .replaceError(with: nil)
            .assign(to: &$user)
    }
}
