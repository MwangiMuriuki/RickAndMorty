//
//  RMEpisodeResponse.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import Foundation


struct RMEpisodeResponse: Codable {
    let info: RMInfo
    let results: [RMEpisodeModel]
}
