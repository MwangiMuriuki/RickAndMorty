//
//  RMCharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 22/02/2024.
//

import Foundation

final class RMCharacterCellViewModel: NSObject {
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?

    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }

    
    /// Expose only the character text, not the Enum itself
    public var charcterStatusText: String {
        return "Status: \(characterStatus.statusText)"
    }

    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void){
        // Abstract to Image Manager
        guard let charUrl = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }

        let request = URLRequest(url: charUrl)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let responseData = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }

            completion(.success(responseData))
        }
        task.resume()

    }
}
