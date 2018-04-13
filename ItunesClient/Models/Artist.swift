//
//  Artist.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 10.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

class Artist {
    let id:Int
    let name:String
    let primaryGenre: Genre
    var albums: [Album]
    
    init(id:Int,name:String,primaryGenre:Genre,albums:[Album]){
        self.id = id
        self.name = name
        self.primaryGenre = primaryGenre
        self.albums = albums
    }
}
extension Artist {
    convenience init?(json: [String: Any]) {
        
        struct Key {
            static let artistName = "artistName"
            static let artistId = "artistId"
            static let primaryGenreId = "primaryGenreId"
        }
        
        guard let artistName = json[Key.artistName] as? String,
            let artistId = json[Key.artistId] as? Int,
            let primaryGenreId = json[Key.primaryGenreId] as? Int,
            let primaryGenreValue = Genre(rawValue: primaryGenreId) else {
                return nil
        }
        
        self.init(id: artistId, name: artistName, primaryGenre: primaryGenreValue, albums: [])
    }
}
