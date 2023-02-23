//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 23/02/2023.
//

import Foundation

///Enum Describing Character Genders as either 'Female', 'Male', 'Genderless' or 'unknown'
enum RMCharacterGender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}
