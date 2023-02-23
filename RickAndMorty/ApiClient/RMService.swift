//
//  RMService.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 23/02/2023.
//

import Foundation


/// Primary API Service to get Rick and Morty Data
final class RMService{
    /// Shared Singleton Instance
    static let shared = RMService()

    /// Privatised Contructor
    private init (){}

    /// Send RM API Call
    /// - Parameters:
    ///   - _request: Request Instance
    ///   - completion: Callback with data or error Completion Handler
    public func execute(_request: RMRequest, completion: @escaping () -> Void){

    }
}
