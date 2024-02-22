//
//  RMInfo.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import Foundation

struct RMInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
