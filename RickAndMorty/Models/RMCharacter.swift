//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 23/02/2023.
//

import Foundation

/// Single Character Properties
struct RMCharacter : Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}


