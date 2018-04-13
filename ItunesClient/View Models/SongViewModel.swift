//
//  SongViewModel.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 11.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title:String
    let runTime:String
}

extension SongViewModel {
    init(song:Song) {
        self.title = song.censoredName
        
        //Track time in miliseconds
        let timeInSeconds = song.trackTime/1000
        let minutes = song.trackTime/60 % 60
        let seconds = timeInSeconds % 60
        
        self.runTime = "\(minutes):\(seconds)"
    }
}
