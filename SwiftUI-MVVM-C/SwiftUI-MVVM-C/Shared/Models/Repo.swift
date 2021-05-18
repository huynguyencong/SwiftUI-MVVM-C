//
//  Repo.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation

struct Repo: Codable, Identifiable {
    var id: Int?
    var name: String?
    var description: String?
    var fork: Bool?
}
