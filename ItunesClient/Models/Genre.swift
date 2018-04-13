//
//  Genre.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 10.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

enum Genre: Int {
    case blues = 2
    case comedy = 3
    case childrensMusic = 4
    case classical = 5
    case country = 6
    case electronic = 7
    case holiday = 8
    case opera = 9
    case singerSongwriter = 10
    case jazz = 11
    case latino = 12
    case newAge = 13
    case pop = 14
    case rythmAndBluesSoul = 15
    case soundtrack = 16
    case dance = 17
    case hipHopRap = 18
    case world = 19
    case alternative = 20
    case rock = 21
    case christianGospel = 22
    case vocal = 23
    case reggae = 24
    case easyListening = 25
    case jPop = 27
    case enka = 28
    case anime = 29
    case kayokyoku = 30
    case fitnessWorkout = 50
    case kPop = 51
    case karaoke = 52
    case instrumental = 53
    case brazilian = 1122
    case spokenWord = 50000061
    case disney = 50000063
    case frenchPop = 50000064
    case germanPop = 50000066
    case germanFolk = 50000068
    
    var name: String {
        switch self {
        case .blues: return "Blues"
        case .comedy: return "Comedy"
        case .childrensMusic: return "Children’s Music"
        case .classical: return "Classical"
        case .country: return "Country"
        case .electronic: return "Electronic"
        case .holiday: return "Holiday"
        case .opera: return "Opera"
        case .singerSongwriter: return "Singer/Songwriter"
        case .jazz: return "Jazz"
        case .latino: return "Latino"
        case .newAge: return "New Age"
        case .pop: return "Pop"
        case .rythmAndBluesSoul: return "R&B/Soul"
        case .soundtrack: return "Soundtrack"
        case .dance: return "Dance"
        case .hipHopRap: return "Hip-Hop/Rap"
        case .world: return "World"
        case .alternative: return "Alternative"
        case .rock: return "Rock"
        case .christianGospel: return "Christian & Gospel"
        case .vocal: return "Vocal"
        case .reggae: return "Reggae"
        case .easyListening: return "Easy Listening"
        case .jPop: return "J-Pop"
        case .enka: return "Enka"
        case .anime: return "Anime"
        case .kayokyoku: return "Kayokyoku"
        case .fitnessWorkout: return "Fitness & Workout"
        case .kPop: return "K-Pop"
        case .karaoke: return "Karaoke"
        case .instrumental: return "Instrumental"
        case .brazilian: return "Brazilian"
        case .spokenWord: return "Spoken Word"
        case .disney: return "Disney"
        case .frenchPop: return "French Pop"
        case .germanPop: return "German Pop"
        case .germanFolk: return "German Folk"
        }
    }
}

extension Genre {
    init?(name: String) {
        switch name {
        case "Blues": self = .blues
        case "Comedy": self = .comedy
        case "Children's Music": self = .childrensMusic
        case "Classical": self = .classical
        case "Country": self = .country
        case "Electronic": self = .electronic
        case "Holiday": self = .holiday
        case "Opera": self = .opera
        case "Singer/Songwriter": self = .singerSongwriter
        case "Jazz": self = .jazz
        case "Latino": self = .latino
        case "New Age": self = .newAge
        case "Pop": self = .pop
        case "R&B/Soul": self = .rythmAndBluesSoul
        case "Soundtrack": self = .soundtrack
        case "Dance": self = .dance
        case "Hip-Hop/Rap": self = .hipHopRap
        case "World": self = .world
        case "Alternative": self = .alternative
        case "Rock": self = .rock
        case "Christian & Gospel": self = .christianGospel
        case "Vocal": self = .vocal
        case "Reggae": self = .reggae
        case "Easy Listening": self = .easyListening
        case "J-Pop": self = .jPop
        case "Enka": self = .enka
        case "Anime": self = .anime
        case "Kayokyoku": self = .kayokyoku
        case "Fitness & Workout": self = .fitnessWorkout
        case "K-Pop": self = .kPop
        case "Karaoke": self = .karaoke
        case "Instrumental": self = .instrumental
        case "Brazilian": self = .brazilian
        case "Spoken Word": self = .spokenWord
        case "Disney": self = .disney
        case "French Pop": self = .frenchPop
        case "German Pop": self = .germanPop
        case "German Folk": self = .germanFolk
        default: return nil
        }
    }
}
