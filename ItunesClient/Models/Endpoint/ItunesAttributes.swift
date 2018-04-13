//
//  ItunesAttributes.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 12.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

protocol ItunesAttribute: QueryItemProvider {
    var attributeName: String { get }
}

extension ItunesAttribute {
    var queryItem: URLQueryItem {
        return URLQueryItem(name: "attribute", value: attributeName)
    }
}

enum MovieAttribute: String, ItunesAttribute {
    case actorTerm
    case genreIndex
    case artistTerm
    case shortFilmTerm
    case producerTerm
    case ratingTerm
    case directorTerm
    case releaseYearTerm
    case featureFilmTerm
    case movieArtistTerm
    case movieTerm
    case ratingIndex
    case descriptionTerm
    
    var attributeName: String {
        return self.rawValue
    }
}

enum PodcastAttribute: String, ItunesAttribute {
    case titleTerm
    case languageTerm
    case authorTerm
    case genreIndex
    case artistTerm
    case ratingIndex
    case keywordsTerm
    case descriptionTerm
    
    var attributeName: String {
        return self.rawValue
    }
}

enum MusicAttribute: String, ItunesAttribute {
    case mixTerm
    case genreIndex
    case artistTerm
    case composerTerm
    case albumTerm
    case ratingIndex
    case songTerm
    
    var attributeName: String {
        return self.rawValue
    }
}

enum MusicVideoAttribute: String, ItunesAttribute {
    case genreIndex
    case artistTerm
    case albumTerm
    case ratingIndex
    case songTerm
    
    var attributeName: String {
        return self.rawValue
    }
}

enum AudiobookAttribute: String, ItunesAttribute {
    case titleTerm
    case authorTerm
    case genreIndex
    case ratingIndex
    
    var attributeName: String {
        return self.rawValue
    }
}

enum ShortFilmAttribute: String, ItunesAttribute {
    case genreIndex
    case artistTerm
    case shortFilmTerm
    case ratingIndex
    case descriptionTerm
    
    var attributeName: String {
        return self.rawValue
    }
}

enum SoftwareAttribute: String, ItunesAttribute {
    case softwareDeveloper
    
    var attributeName: String {
        return self.rawValue
    }
}

enum TVShowAttribute: String, ItunesAttribute {
    case genreIndex
    case tvEpisodeTerm
    case showTerm
    case tvSeasonTerm
    case ratingIndex
    case descriptionTerm
    
    var attributeName: String {
        return self.rawValue
    }
}

enum AllAttribute: String, ItunesAttribute {
    case actorTerm
    case languageTerm
    case allArtistTerm
    case tvEpisodeTerm
    case shortFilmTerm
    case directorTerm
    case releaseYearTerm
    case titleTerm
    case featureFilmTerm
    case ratingIndex
    case keywordsTerm
    case descriptionTerm
    case authorTerm
    case genreIndex
    case mixTerm
    case allTrackTerm
    case artistTerm
    case composerTerm
    case tvSeasonTerm
    case producerTerm
    case ratingTerm
    case songTerm
    case movieArtistTerm
    case showTerm
    case movieTerm
    case albumTerm
    
    var attributeName: String {
        return self.rawValue
    }
}
