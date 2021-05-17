//
//  GithubRouter.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation

enum GithubRouter: RequestInfoConvertible {
    case repos(username: String)
    
    var endpoint: String {
        "https://api.github.com"
    }
    
    var urlString: String {
        "\(endpoint)/\(path)"
    }
    
    var path: String {
        switch self {
        case .repos(let username):
            return "users/\(username)/repos"
        }
    }
    
    func asRequestInfo() -> RequestInfo {
        let requestInfo: RequestInfo = RequestInfo(url: urlString)
                
        // Set other property, like headers, parameters for requestInfo here
        
        return requestInfo
    }
}
