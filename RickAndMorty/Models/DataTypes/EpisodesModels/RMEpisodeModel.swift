//
//  RMEpisodeModel.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 16/02/2024.
//

import Foundation

/// Episodes Model
struct RMEpisodeModel: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String

//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case airDate = "air_date"
//        case episode, characters, url, created
//    }
}
