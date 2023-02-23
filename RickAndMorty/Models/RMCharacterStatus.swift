//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 23/02/2023.
//

import Foundation

/// Enum Describing Character Status as either Alive, Dead or Unknown
enum RMCharacterStatus : String, Codable{
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
