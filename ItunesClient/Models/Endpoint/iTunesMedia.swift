//
//  iTunesMedia.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 11.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

enum ItunesMedia {
    case movie(entity: MovieEntity?, attribute: MovieAttribute?)
    case podcast(entity: PodcastEntity?, attribute: PodcastAttribute?)
    case music(entity: MusicEntity?, attribute: MusicAttribute?)
    case musicVideo(entity: MusicVideoEntity?, attribute: MusicVideoAttribute?)
    case audiobook(entity: AudiobookEntity?, attribute: AudiobookAttribute?)
    case shortFilm(entity: ShortFilmEntity?, attribute: ShortFilmAttribute?)
    case tvShow(entity: TVShowEntity?, attribute: TVShowAttribute?)
    case software(entity: SoftwareEntity?, attribute: SoftwareAttribute?)
    case ebook(entity: EbookEntity?)
    case all(entity: AllEntity?, attribute: AllAttribute?)
}

extension ItunesMedia: CustomStringConvertible {
    var description: String {
        switch self {
        case .movie: return "movie"
        case .podcast: return "podcast"
        case .music: return "music"
        case .musicVideo: return "musicVideo"
        case .audiobook: return "audiobook"
        case .shortFilm: return "shortFilm"
        case .tvShow: return "tvShow"
        case .software: return "software"
        case .ebook: return "ebook"
        case .all: return "all"
        }
    }
}

extension ItunesMedia {
    var entityQueryItem: URLQueryItem? {
        switch self {
        case .movie(let entity, _): return entity?.queryItem
        case .podcast(let entity, _): return entity?.queryItem
        case .music(let entity, _): return entity?.queryItem
        case .musicVideo(let entity, _): return entity?.queryItem
        case .audiobook(let entity, _): return entity?.queryItem
        case .shortFilm(let entity, _): return entity?.queryItem
        case .tvShow(let entity, _): return entity?.queryItem
        case .software(let entity, _): return entity?.queryItem
        case .ebook(let entity): return entity?.queryItem
        case .all(let entity, _): return entity?.queryItem
        }
    }
    
    var attributeQueryItem: URLQueryItem? {
        switch self {
        case .movie(_, let attribute): return attribute?.queryItem
        case .podcast(_, let attribute): return attribute?.queryItem
        case .music(_, let attribute): return attribute?.queryItem
        case .musicVideo(_, let attribute): return attribute?.queryItem
        case .audiobook(_, let attribute): return attribute?.queryItem
        case .shortFilm(_, let attribute): return attribute?.queryItem
        case .tvShow(_, let attribute): return attribute?.queryItem
        case .software(_, let attribute): return attribute?.queryItem
        case .ebook: return nil
        case .all(_, let attribute): return attribute?.queryItem
        }
    }
}
