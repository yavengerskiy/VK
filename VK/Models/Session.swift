//
//  Session.swift
//  VK
//
//  Created by Beelab on 17/04/22.
//

import Foundation

class Session {
    private init() {}
    static let shared = Session()
    
    var token = ""
    var userId = 0
    
}
