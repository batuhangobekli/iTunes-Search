//
//  Album.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 10.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
class Album {
    let id:Int
    let artistName:String
    let name:String
    let censoredName:String
    let artWorkUrl:String
    let isExplicit:Bool
    let numberOfTracks:Int
    let releaseDate:Date
    let primaryGenre: Genre
    var songs = [Song]()
    
    init(id:Int,artistName:String,name:String,censoredName:String,artWorkUrl:String,isExplicit:Bool,numberOfTracks:Int,releaseDate:Date,primaryGenre: Genre) {
         self.id = id
         self.artistName = artistName
         self.name = name
         self.censoredName = censoredName
         self.artWorkUrl = artWorkUrl
         self.isExplicit = isExplicit
         self.numberOfTracks = numberOfTracks
         self.releaseDate = releaseDate
         self.primaryGenre = primaryGenre
    }
}

extension Album {
    convenience init?(json: [String: Any]) {
        
        struct Key {
            static let id = "collectionId"
            static let artistName = "artistName"
            static let name = "collectionName"
            static let censoredName = "collectionCensoredName"
            static let artworkUrl = "artworkUrl100"
            static let collectionExplicitness = "collectionExplicitness"
            static let trackCount = "trackCount"
            static let releaseDate = "releaseDate"
            static let primaryGenre = "primaryGenreName"
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        guard let idValue = json[Key.id] as? Int,
            let artistNameValue = json[Key.artistName] as? String,
            let nameValue = json[Key.name] as? String,
            let censoredNameValue = json[Key.censoredName] as? String,
            let artworkUrlString = json[Key.artworkUrl] as? String,
            let isExplicitValue = json[Key.collectionExplicitness] as? String,
            let numberOfTracksValue = json[Key.trackCount] as? Int,
            let releaseDateString = json[Key.releaseDate] as? String,
            let releaseDateValue = formatter.date(from: releaseDateString),
            let primaryGenreString = json[Key.primaryGenre] as? String,
            let primaryGenreValue = Genre(name: primaryGenreString) else { return nil }
        
        let isExplicit = isExplicitValue == "notExplicit" ? false : true
        
        self.init(id: idValue, artistName: artistNameValue, name: nameValue, censoredName: censoredNameValue, artWorkUrl: artworkUrlString, isExplicit: isExplicit, numberOfTracks: numberOfTracksValue, releaseDate: releaseDateValue, primaryGenre: primaryGenreValue)
    }
}
