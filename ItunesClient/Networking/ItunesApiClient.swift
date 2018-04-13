//
//  ItunesApiClient.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 12.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
    func searchForArtist(with term:String,completion: @escaping ([Artist],ItunesError?) ->Void)  {
        let endpoint = Itunes.search(term: term, media: .music(entity:.musicArtist,attribute: .artistTerm))
        
        performRequest(with: endpoint){results , error in
            guard let results = results else {
                completion([],error)
                return
            }
            let artists =  results.compactMap{Artist(json: $0)}
            
            completion(artists,nil)
        }
    }
    
    
    func lookupArtist(withId Id:Int,completion: @escaping (Artist?, ItunesError?) -> Void ){
        
        let endpoint = Itunes.lookup(id: Id, entity: MusicEntity.album)
        
        performRequest(with: endpoint){results , error in
            guard let results = results  else {
                completion(nil,error)
                return
            }
            guard let artistInfo = results.first else {
                completion(nil,.jsonParsingFailure(message: "Results does not contain artist info"))
                return
            }
            guard let artist = Artist(json: artistInfo) else {
                completion(nil,.jsonParsingFailure(message: "Could not parse artist information"))
                return
            }
            let albumResults = results[1..<results.count]
            let albums = albumResults.compactMap { Album(json: $0)}
            
            artist.albums = albums
            completion(artist,nil)
            
           
        }
    }
    
    typealias Results = [[String:Any]]
    
    private func performRequest(with endpoint:EndPoint,completion: @escaping (Results?,ItunesError?) -> Void){
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error) //if no json returned
                    return
                }
                guard let results = json["results"] as? [[String:Any]] else {
                    completion(nil, .jsonParsingFailure(message: "JSON Data does not contain result"))
                    return
                }
              
                completion(results,nil)
            }
        }
        task.resume()
    }
}
