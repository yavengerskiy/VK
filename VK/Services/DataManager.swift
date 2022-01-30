//
//  DataManager.swift
//  VK
//
//  Created by Beelab on 24/01/22.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempUsers() -> [User] {
        var usersList:[User] = []
        
        let user1 = User(login: "Durov", name: "Павел Дуров", password: "", photos: ["durov", "durov2", "durov3", "durov4"], groups: [], friendsList: [])
        usersList.append(user1)
        let user2 = User(login: "Angelina", name: "Анджелина Джоли", password: "", photos: ["angelina", "angelina2", "angelina3", "angelina4"], groups: [], friendsList: [])
        usersList.append(user2)
        let user3 = User(login: "Anne", name: "Энн Хэтэуэй", password: "", photos: ["anne4", "anne2", "anne3", "anne"], groups: [], friendsList: [])
        usersList.append(user3)
        let user4 = User(login: "Tom", name: "Том Круз", password: "", photos: ["tom", "tom2", "tom3", "tom4"], groups: [], friendsList: [])
        usersList.append(user4)
        let user5 = User(login: "Depp", name: "Джонни Депп", password: "", photos: ["pitt", "pitt2", "pitt3", "pitt4"], groups: [], friendsList: [])
        usersList.append(user5)
        usersList.append(User(login: "User", name: "User", password: "123456", photos: [], groups: [], friendsList: [user1, user2, user3, user4, user5]))
        
        return usersList
    }
    
    func createTempGroups() -> [Group] {
        var groupsList:[Group] = []
        let user = User(login: "testuser", name: "User", password: "123456", photos: [], groups: [], friendsList: [])
        let group1 = Group(craator: user, title: "Cats", image: "cats", description: "Кошки всех пород")
        let group2 = Group(craator: user, title: "Cars", image: "cars", description: "")
        let group3 = Group(craator: user, title: "Flowers", image: "flowers", description: "")
        groupsList.append(group1)
        groupsList.append(group2)
        groupsList.append(group3)
        return groupsList
    }
}
