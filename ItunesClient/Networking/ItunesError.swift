//
//  ItunesError.swift
//  ItunesClient
//
//  Created by Batuhan Göbekli on 12.04.2018.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation

enum ItunesError :Error{
    case requestFailed
    case responseUnsuccesful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message:String)
}
