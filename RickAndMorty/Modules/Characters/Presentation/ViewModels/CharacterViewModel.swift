//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 09/02/24.
//

import Combine
import Foundation

class CharacterViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var imageData: Data?
    
    private let getImageDataUseCase: GetImageDataUseCaseProtocol
    private var subscriptions: Set<AnyCancellable> = .init()
    
    let character: Character
    
    var name: String {
        character.name ?? LocalizedStrings.na
    }
    
    // MARK: - Methods
    
    init(character: Character, getImageDataUseCase: GetImageDataUseCaseProtocol) {
        self.character = character
        self.getImageDataUseCase = getImageDataUseCase
    }
    
    func getImageData() {
        guard let imageURL = character.image else {
            return
        }
        
        getImageDataUseCase
            .execute(url: imageURL)
            .sink { _ in
                
            } receiveValue: { [weak self] data in
                self?.imageData = data
            }
            .store(in: &subscriptions)
    }
}

// MARK: Hashable

extension CharacterViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(character)
    }
}

// MARK: - Equatable

extension CharacterViewModel: Equatable {
    static func == (lhs: CharacterViewModel, rhs: CharacterViewModel) -> Bool {
        return lhs.character == rhs.character
    }
}
