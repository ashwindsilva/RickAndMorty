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
            viewState = viewModels.isEmpty ? .empty : .loaded
        }
    }
    
    private let getCharactersUseCase: GetCharactersUseCaseProtocol
    private let characterViewModelFactory: CharacterViewModelFactory
    private var subscriptions: Set<AnyCancellable> = .init()
    private var isPaginationInProgress: Bool = false
    private var currentPage: Int = 1
    
    init(
        getCharactersUseCase: GetCharactersUseCaseProtocol,
        characterViewModelFactory: CharacterViewModelFactory
    ) {
        self.getCharactersUseCase = getCharactersUseCase
        self.characterViewModelFactory = characterViewModelFactory
    }
    
    func getCharacters(at page: Int = 1) {
        isPaginationInProgress = true
        getCharactersUseCase.execute(page: page)
            .sink(receiveCompletion: { [weak self] _ in
                self?.isPaginationInProgress = false
            }, receiveValue: { [weak self] characterList in
                guard let self else { return }
                if let characters = characterList.results {
                    let viewModels = characters.map { self.characterViewModelFactory.make(character: $0) }
                    self.viewModels.append(contentsOf: viewModels)
                }
            })
            .store(in: &subscriptions)
    }
    
    func getMoreCharactersIfNeeded() {
        guard isPaginationInProgress == false else {
            return
        }
        currentPage += 1
        getCharacters(at: currentPage)
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
