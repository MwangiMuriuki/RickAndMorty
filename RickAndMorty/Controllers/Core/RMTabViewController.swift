//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Ernest Mwangi on 16/02/2024.
//

import UIKit

/// Controller to house Tabs and Root tab controllers
class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs(){
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()

        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic

        let navControllerCharacters = UINavigationController(rootViewController: characterVC)
        let navControllerLocation = UINavigationController(rootViewController: locationVC)
        let navControllerEpisodes = UINavigationController(rootViewController: episodesVC)
        let navControllerSettings = UINavigationController(rootViewController: settingsVC)

        navControllerCharacters.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        navControllerLocation.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        navControllerEpisodes.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        navControllerSettings.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)


        for navigation in [navControllerCharacters, navControllerEpisodes, navControllerLocation, navControllerSettings]{
            navigation.navigationBar.prefersLargeTitles = true
        }

        setViewControllers(
            [navControllerCharacters, navControllerEpisodes, navControllerLocation, navControllerSettings],
            animated: true)

    }


}

