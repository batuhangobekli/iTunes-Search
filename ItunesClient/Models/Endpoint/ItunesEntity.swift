//
//  ItunesEntity.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 11.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

protocol ItunesEntity: QueryItemProvider {
    var entityName: String { get }
}

extension ItunesEntity {
    var queryItem: URLQueryItem {
        return URLQueryItem(name: "entity", value: entityName)
    }
}

enum MovieEntity: String, ItunesEntity {
    case movieArtist
    case movie
    
    var entityName: String {
        return self.rawValue
    }
}

enum PodcastEntity: String, ItunesEntity {
    case podcastAuthor
    case podcast
    
    var entityName: String {
        return self.rawValue
    }
}

enum MusicEntity: String, ItunesEntity {
    case musicArtist
    case musicTrack
    case album
    case musicVideo
    case mix
    case song
    
    var entityName: String {
        return self.rawValue
    }
}

enum MusicVideoEntity: String, ItunesEntity {
    case musicArtist
    case musicVideo
    
    var entityName: String {
        return self.rawValue
    }
}

enum AudiobookEntity: String, ItunesEntity {
    case audiobookAuthor
    case audiobook
    
    var entityName: String {
        return self.rawValue
    }
}

enum ShortFilmEntity: String, ItunesEntity {
    case shortFilmArtist
    case shortFilm
    
    var entityName: String {
        return self.rawValue
    }
}

enum TVShowEntity: String, ItunesEntity {
    case tvEpisode
    case tvSeason
    
    var entityName: String {
        return self.rawValue
    }
}

enum SoftwareEntity: String, ItunesEntity {
    case software
    case iPadSoftware
    case macSoftware
    
    var entityName: String {
        return self.rawValue
    }
}

enum EbookEntity: String, ItunesEntity {
    case ebook
    
    var entityName: String {
        return self.rawValue
    }
}

enum AllEntity: String, ItunesEntity {
    case movie
    case album
    case allArtist
    case podcast
    case musicVideo
    case mix
    case audiobook
    case tvSeason
    case allTrack
    
    var entityName: String {
        return self.rawValue
    }
}
