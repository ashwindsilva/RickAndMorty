//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 06/02/24.
//

import Combine
import Foundation

final class CharactersViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var viewState: ViewState = .empty
    
    @Published private(set) var viewModels: [CharacterViewModel] = .init() {
        didSet {
            if viewModels.isEmpty == false {
                viewState = .loaded
            }
        }
    }
    
    private let getCharactersUseCase: GetCharactersUseCaseProtocol
    private var subscriptions: Set<AnyCancellable> = .init()
    private var isPaginationInProgress: Bool = false
    
    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func getCharacters() {
        getCharactersUseCase.execute()
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { characterList in
                if let characters = characterList.results {
                    self.viewModels = characters.map { CharacterViewModel(character: $0) }
                }
            })
            .store(in: &subscriptions)
    }
    
    func getMoreCharactersIfNeeded() {
        guard isPaginationInProgress == false else {
            return
        }
        
        isPaginationInProgress = true
    }
}

extension CharactersViewModel {
    enum ViewState {
        case loading
        case empty
        case loaded
    }
    
    enum Section {
        case  main
    }
}
