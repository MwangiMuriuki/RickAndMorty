//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 23/02/2023.
//

import Foundation

/// Object that represents a single Api call
final class RMRequest{

    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    /// Endpoint
    private let endpoint: RMEndpoint

    /// Path Components for API if Any
    private let pathComponents: Set<String>

    /// Query Parameters for API if Any
    private let queryParams: [URLQueryItem]

    /// HTTP Method
    public let httpMethod = "GET"

    /// Constructed url for the api endpoint in string format
    private var urlString: String{
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue

        // MARK: - Loop over each path component and add a trailing slash to it
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }

        // MARK: - Loop over each query parameter and add a trailing slash to it
        if !queryParams.isEmpty{
            string += "?"
            let argumentString =  queryParams.compactMap({
                guard let value = ($0.value) else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")

            string += argumentString
        }

        return string
    }

    /// Computed and constructed API url
    public var url: URL?{
        return URL(string: urlString)
    }

    /// Initialize the RMRequest Class
    public init(endpoint: RMEndpoint, pathComponents: Set<String> = [],queryParams: [URLQueryItem]) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParams = queryParams
    }
}
