//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 23/02/2023.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"

        let request = RMRequest(
            endpoint: .character,
            pathComponents: ["2"],
            queryParams: [URLQueryItem(name: "name", value: "Rick"),
                          URLQueryItem(name: "status", value: "alive")
                         ]
        )

        guard let requestURL = (request.url) else {return}

        print("Character URL: \(requestURL)")


    }


}
