//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import Foundation


/// Character Gender with RawValue of type String
enum RMCharacterGender: String, Codable {
    //('Female', 'Male', 'Genderless' or 'unknown')
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}
