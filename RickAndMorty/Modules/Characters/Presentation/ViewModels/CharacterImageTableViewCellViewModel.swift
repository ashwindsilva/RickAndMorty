//
//  CharacterImageTableViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 21/02/24.
//

import Combine
import Foundation

class CharacterImageTableViewCellViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var imageData: Data?
    
    private let character: Character
    private let getImageDataUseCase: GetImageDataUseCaseProtocol
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // MARK: - Methods
    
    init(character: Character, getImageDataUseCase: GetImageDataUseCaseProtocol) {
        self.character = character
        self.getImageDataUseCase = getImageDataUseCase
    }
    
    func getImageData() {
        guard let imageURL = character.image else {
            return
        }
        
        getImageDataUseCase.execute(url: imageURL)
            .sink { _ in
                
            } receiveValue: { [weak self] data in
                self?.imageData = data
            }
            .store(in: &subscriptions)

    }
}
