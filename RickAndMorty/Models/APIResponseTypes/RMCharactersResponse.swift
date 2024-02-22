//
//  RMCharactersResponse.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import Foundation


struct RMCharactersResponse: Codable {
    let info: RMInfo
    let results: [RMCharacterModel]
}
