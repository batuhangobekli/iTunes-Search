//
//  Endpoint.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 11.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

protocol EndPoint {
    var base:String {get}
    var path:String {get}   //create url
    var queryItems:[URLQueryItem] {get}
}
extension EndPoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        return components
        }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum Itunes {
    case search(term:String,media:ItunesMedia?)
    case lookup(id:Int,entity:ItunesEntity?)
    
}

extension Itunes: EndPoint {
    var path: String {
        switch self {
        case .search: return "/search"
        case .lookup: return "/lookup"
        }
    }
    
    
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(let term,let media):
            var result = [URLQueryItem]()
        
            let  searchTermItem = URLQueryItem(name: "term", value: term)
            result.append(searchTermItem)
            
            if let media = media {
                let mediaItem = URLQueryItem(name: "media", value: media.description)  //optional
                result.append(mediaItem)
            }
            if let entityQueryItem = media?.entityQueryItem {
                result.append(entityQueryItem)
            }
            if let attributeQueryItem = media?.attributeQueryItem{
                result.append(attributeQueryItem)
            }
        return result
            
        case .lookup(let id,let entity):
            return [
                URLQueryItem(name: "id", value:id.description),
                URLQueryItem(name: "entity", value:entity?.entityName)
            ]
        }
    }
    
    
    
    var base: String{
        return "https://itunes.apple.com"
    }
}
