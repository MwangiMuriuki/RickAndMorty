//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import Foundation

/// Object that represents single API call
final class RMRequest {
    /// Endpoint
    let endpoint: RMEndpoint
    /// Path Components after the Endpoint
    var pathComponents: [String]
    /// Query Parameters after the Endpoint
    var queryParameters: [URLQueryItem]
    
    /// Constructed URL for the Api request in String format
    public var urlString: String{
        var string = Constants.BASEURL

        string += endpoint.rawValue

//        if !pathComponents.isEmpty {
//            pathComponents.forEach({
//                string += "/\($0)"
//            })
//        }

        if !pathComponents.isEmpty {
            if pathComponents.count == 1{
                for index in pathComponents{
                    string += "/\(index)"
                }
            }
            else {
                string += "/"
                let argumentString = pathComponents.compactMap({
                    return "\($0)"
                }).joined(separator: ",")

                string += argumentString
            }

        }

        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")

           string += argumentString
        }

        return string
    }
    
    /// Constructed URL for the Api request in URL format
    public var url: URL? {
        return URL(string: urlString)
    }

    ///Request Method
    public let httpMethod = "GET"

    public init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listAllCharactersRequest = RMRequest(endpoint: .character)
    static let listAllLocationsRequest = RMRequest(endpoint: .location)
    static let listAllEpisodesRequest = RMRequest(endpoint: .episode)
}

