//
//  User.swift
//  VK
//
//  Created by Beelab on 23/01/22.
//

import Foundation

struct User {
    let login: String
    let name: String
    var password: String
    var photos: [String]
    var groups: [Group]
    var friendsList: [User]
}
