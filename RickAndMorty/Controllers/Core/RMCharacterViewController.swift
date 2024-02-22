//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 16/02/2024.
//

import UIKit

/// Controller to show and search for Charaacters
final class RMCharacterViewController: UIViewController {

    private let characterListView = RMCharacterListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            characterListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            characterListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])



    }


}
