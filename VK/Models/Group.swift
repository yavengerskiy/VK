//
//  Group.swift
//  VK
//
//  Created by Beelab on 23/01/22.
//

import Foundation

struct Group {
    let craator: User
    let title: String
    let image: String
    let description: String
    let users: [User] = []
}
