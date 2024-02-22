//
//  RMCharacterModel.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 16/02/2024.
//

import Foundation


struct RMCharacterModel: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String?
    let gender: String
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}



