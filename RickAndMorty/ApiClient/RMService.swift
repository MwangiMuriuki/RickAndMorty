//
//  RMService.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import Foundation

/// Service Caller Class
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()

    private init(){}
    
    /// Send API Call - Make a request with a generic type of RMGeneric -
        /// (RMGeneric can be renamed to anything)
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func makeRequest<RMGeneric: Codable>(
        _ rmRequest: RMRequest,
        expecting dataType: RMGeneric.Type,
        completion: @escaping (Result<RMGeneric, Error>) -> Void
    ){
        guard let urlRequest = getUrlrequest(from: rmRequest) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let responseData = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }

            do {
                let result = try JSONDecoder().decode(dataType, from: responseData)
                print(String(describing: result))
                completion(.success(result))
            } catch  {
                completion(.failure(error))
                print("Decode Error: " + String(describing: error))
            }
        }

        task.resume()

    }

    private func getUrlrequest(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
