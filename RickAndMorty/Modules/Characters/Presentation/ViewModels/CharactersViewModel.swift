//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 06/02/24.
//

import Combine

final class CharactersViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var viewState: ViewState = .empty
}

extension CharactersViewModel {
    enum ViewState {
        case loading
        case empty
    }
}
