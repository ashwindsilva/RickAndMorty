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
    
    private let getCharactersUseCase: GetCharactersUseCaseProtocol
    
    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        self.getCharactersUseCase = getCharactersUseCase
    }
}

extension CharactersViewModel {
    enum ViewState {
        case loading
        case empty
    }
}
