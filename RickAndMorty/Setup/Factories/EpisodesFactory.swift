//
//  EpisodesFactory.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import Foundation

protocol EpisodesFactoryProtocol {
    func makeEpisodesViewController() -> EpisodesViewController
}

struct EpisodesFactory: EpisodesFactoryProtocol {
    func makeEpisodesViewController() -> EpisodesViewController {
        let episodesViewController = EpisodesViewController()
        episodesViewController.title = Tab.episodes.title
        
        return episodesViewController
    }
}
