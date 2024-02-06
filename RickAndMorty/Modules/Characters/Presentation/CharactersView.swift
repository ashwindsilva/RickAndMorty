//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 06/02/24.
//

import UIKit

class CharactersView: UIView {
    
    // MARK: - Properties
    
    let viewModel: CharactersViewModel
    
    // MARK: - Methods
    
    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
