//
//  GetDataFromVKApi.swift
//  VK
//
//  Created by Beelab on 18/04/22.
//

import Foundation

class GetDataFromVKApi {
    
    enum endpoindsAPI {
        case getFriends
        case getAllPhotos
        case getGroups
        case searchGroups
    }
    
    func getData(_ parameters: endpoindsAPI) {
        
        let session =  URLSession(configuration: URLSessionConfiguration.default)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        switch parameters {
        case .getFriends:
            urlConstructor.path = "/method/friends.get"
            urlConstructor.queryItems?.append(URLQueryItem(name: "user_id", value: String(Session.shared.userId)))
            urlConstructor.queryItems?.append(URLQueryItem(name: "fields", value: "photo_50"))
        case .getAllPhotos:
            urlConstructor.path = "/method/photos.getAll"
            urlConstructor.queryItems?.append(URLQueryItem(name: "owner_id", value: String(Session.shared.userId)))
        case .getGroups:
            urlConstructor.path = "/method/groups.get"
            urlConstructor.queryItems?.append(URLQueryItem(name: "user_id", value: String(Session.shared.userId)))
            urlConstructor.queryItems?.append(URLQueryItem(name: "extended", value: "1"))
        case .searchGroups:
            urlConstructor.path = "/method/groups.search"
            urlConstructor.queryItems?.append(URLQueryItem(name: "q", value: "video")) // нужна фраза для поиска
            urlConstructor.queryItems?.append(URLQueryItem(name: "type", value: "group"))
        }
        
        session.dataTask(with: urlConstructor.url!) { (data, response, error) in
            guard let data = data, let result = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) else { return }
            print("Вывод из ответа: \(result)")
        }.resume()
    }
    
}

