//
//  RMLocationModel.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 16/02/2024.
//

import Foundation

/// Location Model
struct RMLocationModel: Codable {
    let id: Int
    let name: String
    let type: String?
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
