//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 23/02/2023.
//

import Foundation

/// Represents unique API endpoints
@frozen enum RMEndpoint: String{
    ///Endpoint to get Character info
    case character
    ///Endpoint to get Location info
    case location
    ///Endpoint to get episode info
    case episode
}
