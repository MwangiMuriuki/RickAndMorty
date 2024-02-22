//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import Foundation

/// Chatacter Status with RawValue of type String
enum RMCharacterStatus: String, Codable {
    //('Alive', 'Dead' or 'unknown')
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"

    var statusText: String {
        switch self {
        case .alive:
            return rawValue
        case .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
